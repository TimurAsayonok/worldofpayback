//
//  SwiftUIView.swift
//  wordofpayback
//
//  Created by Tsimur Asayonak on 12/19/23.
//

import ComposableArchitecture

struct Screen: Reducer {
    enum State: Equatable {
        case home(WelcomeStore.State)
    }
    
    enum Action: Equatable {
        case home(WelcomeStore.Action)
    }
    
    var body: some Reducer<State, Action> {
        Scope(state: /State.home, action: /Action.home) {
            WelcomeStore()
        }
    }
}
