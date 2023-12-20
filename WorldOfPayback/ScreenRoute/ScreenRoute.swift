//
//  SwiftUIView.swift
//  WorldOfPayback
//
//  Created by Tsimur Asayonak on 12/19/23.
//

import ComposableArchitecture

struct ScreenRoute: Reducer {
    enum State: Equatable {
        case welcome(WelcomeStore.State)
        case transactionsList(TransactionListStore.State)
    }
    
    enum Action: Equatable {
        case welcome(WelcomeStore.Action)
        case transactionsList(TransactionListStore.Action)
    }
    
    var body: some Reducer<State, Action> {
        Scope(state: /State.welcome, action: /Action.welcome) {
            WelcomeStore()
        }
        Scope(state: /State.transactionsList, action: /Action.transactionsList) {
            TransactionListStore()
        }
    }
}
