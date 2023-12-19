//
//  SwiftUIView.swift
//  wordofpayback
//
//  Created by Tsimur Asayonak on 12/19/23.
//

import ComposableArchitecture

struct Screen: Reducer {
    enum State: Equatable {
        case welcome(WelcomeStore.State)
    }
    
    enum Action: Equatable {
        case welcome(WelcomeStore.Action)
    }
    
    var body: some Reducer<State, Action> {
        Scope(state: /State.welcome, action: /Action.welcome) {
            WelcomeStore()
        }
    }
}
