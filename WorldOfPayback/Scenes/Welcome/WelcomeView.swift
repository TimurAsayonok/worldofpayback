//
//  WelcomeView.swift
//  WorldOfPayback
//
//  Created by Tsimur Asayonak on 12/19/23.
//

import ComposableArchitecture
import SwiftUI

struct WelcomeView: View {
    let store: StoreOf<WelcomeStore>
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            VStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color(.purple))
                    .frame(width: 40, height: 40)
                
                Text("Welcome").font(.largeTitle).bold()
                
                PrimaryButton(title: "Open the App") {
                    viewStore.send(.loginTapped)
                }
                
                Spacer()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
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
    
    var body: some ReducerOf<Self> {
        Reduce<State, Action> { _, action in
            switch action {
            case .loginTapped:
                // will be handled in Coordinator.reducer
                return .none
            }
        }
    }
}
