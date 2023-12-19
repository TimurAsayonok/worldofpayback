//
//  WelcomeView.swift
//  wordofpayback
//
//  Created by Tsimur Asayonak on 12/19/23.
//

import ComposableArchitecture
import SwiftUI

struct WelcomeView: View {
    let store: StoreOf<WelcomeStore>
    
    var body: some View {
        VStack {
            Text("Welcome").font(.headline)
            Button("Open the App") {
                store.send(.loginTapped)
            }
        }
    }
}

struct WelcomeStore: Reducer {
    struct State: Equatable {
        let id = UUID()
    }
    
    enum Action: Equatable {
        case loginTapped
    }
    
    struct Environment {
        
    }
    
    var body: some ReducerOf<Self> {
        Reduce<State, Action> { state, action in
            switch action {
            case .loginTapped:
                print("loginTapped")
                return .none
            }
        }
    }
}

#Preview {
    WelcomeView(
        store:
            Store(initialState: WelcomeStore.State(), reducer: {
                WelcomeStore()
            }
        )
    )
}
