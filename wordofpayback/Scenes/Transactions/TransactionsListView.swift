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
        VStack {
            Text("Transaction List View").font(.headline)
            Button("Open the App") {
                store.send(.transactionItemTapped)
            }
        }
    }
}

struct TransactionListStore: Reducer {
    struct State: Equatable {
        let id = UUID()
    }
    
    enum Action {
        case transactionItemTapped
    }
    
    var body: some ReducerOf<Self> {
        Reduce<State, Action> { state, action in
            switch action {
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
