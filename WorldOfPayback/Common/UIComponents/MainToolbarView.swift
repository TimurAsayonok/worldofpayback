//
//  MainToolBar.swift
//  WorldOfPayback
//
//  Created by Tsimur Asayonak on 12/23/23.
//

import SwiftUI
import ComposableArchitecture

struct MainToolbarView: View {
    var store: StoreOf<MainToolbarStore>
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            HStack {
                ForEach(viewStore.toolbarButtons, id: \.uuid) { button in
                    Button(action: {
                        viewStore.send(.toolbarButtonPressed(button))
                    }, label: {
                        button.type?.getIcon()
                    })
                }
            }
        }
    }
}

struct MainToolbarStore: Reducer {
    struct State: Equatable {
        let toolbarButtons: [ToolbarButton] = [
            .init(type: .filter), .init(type: .refresh)
        ]
    }
    
    enum Action: Equatable {
        case toolbarButtonPressed(ToolbarButton)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { _, action in
            switch action {
            case .toolbarButtonPressed:
                // will be handled in TransactionListView.reducer
                return .none
            }
        }
    }
}
