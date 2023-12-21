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
                ForEach(viewStore.state.transactionList, id: \.self) { transaction in
                    VStack {
                        Text("Transaction List View \(transaction.partnerDisplayName ?? "")").font(.headline)
                        Button("Open the App") {
                            store.send(.transactionItemTapped)
                        }
                    }
                }
            }
        }
        .onAppear(perform: {
            store.send(.getTransactionList)
        })
    }
}

struct TransactionListStore: Reducer {
    struct State: Equatable {
        let id = UUID()
        var transactionList: [TransactionModel] = []
        var alertMessage: String?
    }
    
    enum Action: Equatable {
        case getTransactionList
        case transactionItemTapped
        case getTransactionListSucceed([TransactionModel])
        case getTransactionListError(ErrorResponse?)
    }
    
    @Dependency(\.apiService) var apiService
    
    var body: some ReducerOf<Self> {
        Reduce<State, Action> { state, action in
            switch action {
            case .getTransactionList:
//                return .run { send in
//                    let response = try await apiService.getTransactionList()
//                    await send(.getTransactionListSucceed(response))
//                } catch: { error, send in
//                    print("Error:", error)
//                    await send(.getTransactionListError)
//                }
                return .run { send in
                    let response = try await apiService.postData()
                    print("response", response)
                } catch: { error, send in
                    await send(.getTransactionListError(error as? ErrorResponse))
                }

                
            case .transactionItemTapped:
                print("transactionItemTapped")
                return .none
                
            case .getTransactionListSucceed:
                return .none
            
            case let .getTransactionListError(error):
                guard let errorMessage = error?.message else {
                    return .none
                }
                
                print("Error:", errorMessage)
                
                state.transactionList = TransactionModel.mockedList()
                return .none
            }
        }
    }
}
