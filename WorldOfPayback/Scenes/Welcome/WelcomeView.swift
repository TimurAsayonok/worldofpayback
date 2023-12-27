//
//  WelcomeView.swift
//  WorldOfPayback
//
//  Created by Tsimur Asayonak on 12/19/23.
//

import ComposableArchitecture
import WorldOfPaybackAppComponents
import SwiftUI

struct WelcomeView: View {
    let store: StoreOf<WelcomeStore>
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            VStack(alignment: .leading) {
                Spacer()
                
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color(.purple))
                    .frame(width: 40, height: 40)
                    .padding(.vertical, 20)
                
                Text(L10N.welcomeScreenTitle).font(.largeTitle).bold()
                
                Text(L10N.welcomeScreenMessage + L10N.startButtonTitle).font(.caption)
                
                Button(L10N.startButtonTitle) {
                    viewStore.send(.loginTapped)
                }
                .buttonStyle(PrimaryButtonStyle())
                .padding(.vertical, 20)
                
                Spacer()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
        }
    }
}

struct WelcomeStore: Reducer {
    struct State: Equatable {}
    
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
