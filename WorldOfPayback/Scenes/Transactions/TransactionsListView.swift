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
                        Text("\(L10N.transactionListTotalAmount) \(viewStore.state.totalAmount)")
                            .font(.callout)
                            .bold()
                        
                        VStack(alignment: .leading) {
                            ForEach(viewStore.state.filteredList, id: \.self.alias?.reference) { transaction in
                                TransactionView(transaction: transaction)
                                    .onTapGesture {
                                        store.send(.transactionItemTapped(transaction))
                                    }
                            }
                        }
                        .padding(.horizontal, 16)
                    }
                }
            }
            .navigationTitle(L10N.transactionListTitle)
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
                    dismissButton: .cancel(Text(L10N.closeButton))
                )
            }
            .sheet(isPresented: viewStore.binding(
                get: { $0.alertModel == nil },
                send: { _ in .closeAlertAndRefresh }
            )) {
                IfLetStore(
                    self.store.scope(state: { $0.filtersState }, action: TransactionListStore.Action.filtersAction)
                ) { store in
                    FiltersView(store: store)
                    .padding()
                    .presentationDetents([.fraction(0.5)])
                }
                
            }
        }
        .onAppear(perform: {
            store.send(.initScreen)
        })
    }
    
    @ViewBuilder
    private func toolbarLoading(_ isLoading: Bool, refresh: @escaping () -> Void) -> some View {
        if isLoading {
            ProgressView()
        } else {
            HStack {
                Button(action: {
                    
                }, label: {
                    Image(systemName: "slider.horizontal.3")
                        .tint(Color.black)
                })
                Button(action: {
                    refresh()
                }, label: {
                    Image(systemName: "arrow.clockwise")
                        .tint(Color.black)
                })
            }
        }
    }
    
    @ViewBuilder
    private func emptyView() -> some View {
        VStack {
            Text(L10N.transactionListEmptyTitle).font(.title2)
            Text(L10N.transactionListEmptyDescription).font(.footnote)
        }
    }
}

struct TransactionListStore: Reducer {
    struct State: Equatable {        
        let id = UUID()
        var transactionList: [TransactionModel] = []
        var isLoading: Bool = false
        var alertModel: AlertModel?
        var filteredType: FilterType?
        var filtersState = FiltersStore.State()
        
        var filteredList: [TransactionModel] {
            let sorting: (ComparisonResult) -> [TransactionModel] = { comparison in
                transactionList.sorted(by: {
                    let leftDate = $0.transactionDetail?.bookingDate
                    let rightDate = $1.transactionDetail?.bookingDate
                    return leftDate?.compare(rightDate ?? Date()) == comparison
                })
            }
            switch filteredType {
            case .byDate(0):
                return sorting(.orderedDescending)
            case .byDate(1):
                return sorting(.orderedAscending)
            case .category(let number):
                return transactionList.filter { $0.category == number }
            default:
                return transactionList
            }
        }
        
        var totalAmount: Int {
            filteredList.reduce(0, { $0 + ($1.transactionDetail?.value?.amount ?? 0) })
        }
    }
    
    enum Action: Equatable {
        case initScreen
        case getTransactionList
        case transactionItemTapped(TransactionModel)
        case getTransactionListSucceed([TransactionModel])
        case getTransactionListError(ErrorResponse?)
        case closeAlertAndRefresh
        case filtersAction(FiltersStore.Action)
    }
    
    @Dependency(\.apiService) 
    var apiService
    
    var body: some ReducerOf<Self> {
        Reduce<State, Action> { state, action in
            switch action {
            case .initScreen:
                print(state.transactionList.isEmpty)
                guard state.transactionList.isEmpty else {
                    return .none
                }
                
                return .send(.getTransactionList)
                
            case .getTransactionList:
                state.isLoading = true
                
                return .run { send in
                    let response = try await apiService.getTransactionList()
                    await send(.getTransactionListSucceed(response))
                } catch: { error, send in
                    await send(.getTransactionListError(error as? ErrorResponse))
                }

            case .transactionItemTapped:
                // will be handled in Coordinator.Reducer
                return .none
                
            case let .getTransactionListSucceed(items):
                state.isLoading = false
                state.transactionList = items
                state.filteredType = .byDate(0)
                return .none
            
            case let .getTransactionListError(error):
                state.isLoading = false
                state.alertModel = AlertModel(message: error?.localizedDescription)
                return .none
                
            case .closeAlertAndRefresh:
                state.alertModel = nil
                return .send(.getTransactionList)
                
            case let .filtersAction(.selectFilter(filterType)):
                state.filteredType = filterType
                return .none
            }
        }
    }
}
