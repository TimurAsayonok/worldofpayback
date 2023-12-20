//
//  TransactionsListView.swift
//  wordofpayback
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
    }
    
    enum Action {
        case getTransactionList
        case transactionItemTapped
    }
    
    var body: some ReducerOf<Self> {
        Reduce<State, Action> { state, action in
            switch action {
            case .getTransactionList:
                state.transactionList = TransactionModel.mockedList()
                return .none
                
            case .transactionItemTapped:
                print("transactionItemTapped")
                return .none
            }
        }
    }
}
//
//#Preview {
//    TransactionsListView()
//}
