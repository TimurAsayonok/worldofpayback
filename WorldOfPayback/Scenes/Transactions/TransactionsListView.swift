//
//  TransactionsListView.swift
//  WorldOfPayback
//
//  Created by Tsimur Asayonak on 12/19/23.
//

import SwiftUI
import ComposableArchitecture

struct TransactionsListView: View {
    var store: StoreOf<TransactionListStore>
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            VStack {
                if viewStore.state.transactionList.isEmpty {
                    emptyView()
                } else {
                    ScrollView {
                        VStack(alignment: .leading) {
                            ForEach(viewStore.state.transactionList, id: \.self.alias?.reference) { transaction in
                                TransactionView(transaction: transaction)
                                    .onTapGesture {
                                        store.send(.transactionItemTapped)
                                    }
                            }
                        }
                        .padding(.horizontal, 16)
                    }
                }
            }
            .navigationTitle("Transactions")
            .toolbar {
                toolbarLoading(viewStore.state.isLoading) {
                    store.send(.getTransactionList)
                }
            }
            .alert(isPresented: viewStore.binding(
                get: { $0.alertModel != nil },
                send: { _ in .closeAlertAndRefresh }
            )) {
                Alert(
                    title: Text(viewStore.state.alertModel?.title ?? ""),
                    message: Text(viewStore.state.alertModel?.message ?? ""),
                    dismissButton: .cancel(Text("Close"))
                )
            }
        }
        .onAppear(perform: {
            store.send(.getTransactionList)
        })
    }
    
    @ViewBuilder
    private func toolbarLoading(_ isLoading: Bool, refresh: @escaping () -> Void) -> some View {
        if isLoading {
            ProgressView()
        } else {
            Button(action: {
                refresh()
            }, label: {
                Image(systemName: "arrow.clockwise")
            })
        }
    }
    
    @ViewBuilder
    private func emptyView() -> some View {
        VStack {
            Text("List is Empty").font(.title2)
            Text("Try to refresh the list or try later").font(.footnote)
        }
    }
}

struct TransactionListStore: Reducer {
    struct State: Equatable {
        let id = UUID()
        var transactionList: [TransactionModel] = []
        var isLoading: Bool = false
        var alertModel: AlertModel?
    }
    
    enum Action: Equatable {
        case getTransactionList
        case transactionItemTapped
        case getTransactionListSucceed([TransactionModel])
        case getTransactionListError(ErrorResponse?)
        case closeAlertAndRefresh
    }
    
    @Dependency(\.apiService) 
    var apiService
    
    var body: some ReducerOf<Self> {
        Reduce<State, Action> { state, action in
            switch action {
            case .getTransactionList:
                state.isLoading = true
                
                return .run { send in
                    let response = try await apiService.getTransactionList()
                    await send(.getTransactionListSucceed(response))
                } catch: { error, send in
                    await send(.getTransactionListError(error as? ErrorResponse))
                }

            case .transactionItemTapped:
                return .none
                
            case let .getTransactionListSucceed(items):
                state.isLoading = false
                state.transactionList = items
                return .none
            
            case let .getTransactionListError(error):
                state.isLoading = false
                state.alertModel = AlertModel(message: error?.localizedDescription
                  )
                
                print("Error:", error?.localizedDescription)
                return .none
                
            case .closeAlertAndRefresh:
                state.alertModel = nil
                return .send(.getTransactionList)
            }
        }
    }
}
