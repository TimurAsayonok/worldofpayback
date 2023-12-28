//
//  Created by Tsimur Asayonak on 12/19/23.
//

import SwiftUI
import ComposableArchitecture
import LocalizationStrings
import WorldOfPaybackAppComponents
import WorldOfPaybackAppExtensions

public struct WelcomeView: View {
    let store: StoreOf<WelcomeStore>
    
    public init(store: StoreOf<WelcomeStore>) {
        self.store = store
    }
    
    public var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            VStack(alignment: .leading) {
                Spacer()
                
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.secondaryColor)
                    .frame(width: 40, height: 40)
                    .padding(.vertical, 20)
                
                Text(L10N.welcomeScreenTitle).font(.largeTitle).bold()
                
                Text(L10N.welcomeScreenMessage + L10N.startButtonTitle).font(.footnote)
                
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

public struct WelcomeStore: Reducer {
    public struct State: Equatable {
        public init() {}
    }
    
    public enum Action: Equatable {
        case loginTapped
    }
    
    public var body: some ReducerOf<Self> {
        Reduce<State, Action> { _, action in
            switch action {
            case .loginTapped:
                // will be handled in Coordinator.reducer
                return .none
            }
        }
    }
    
    public init() {}
}
