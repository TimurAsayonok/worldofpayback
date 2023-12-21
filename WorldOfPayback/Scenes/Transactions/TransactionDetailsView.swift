//
//  TransactionDetailsView.swift
//  WorldOfPayback
//
//  Created by Tsimur Asayonak on 12/19/23.
//

import ComposableArchitecture
import SwiftUI

struct TransactionDetailsView: View {
    let store: StoreOf<TransactionDetailsStore>
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            VStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color(.purple))
                    .frame(width: 40, height: 40)
                
                Text(viewStore.transaction.partnerDisplayName ?? "")
                    .font(.largeTitle)
                    .bold()
                
                PrimaryButton(title: "Open the App") {
                    store.send(.loginTapped)
                }
                
                Spacer()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
        }
        
    }
}

struct TransactionDetailsStore: Reducer {
    struct State: Equatable {
        let id = UUID()
        let transaction: TransactionModel
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
    TransactionDetailsView(
        store:
            Store(
                initialState: TransactionDetailsStore.State(transaction: .mock()),
                reducer: {
                    TransactionDetailsStore()
                }
            )
    )
}
