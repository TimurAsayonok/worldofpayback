//
//  MainToolBar.swift
//  WorldOfPayback
//
//  Created by Tsimur Asayonak on 12/23/23.
//

import SwiftUI
import ComposableArchitecture
import WorldOfPaybackModels

public struct MainToolbarView: View {
    var store: StoreOf<MainToolbarStore>
    
    public init(store: StoreOf<MainToolbarStore>) {
        self.store = store
    }
    
    public var body: some View {
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

public struct MainToolbarStore: Reducer {
    public struct State: Equatable {
        let toolbarButtons: [ToolbarButton]
        
        public init(toolbarButtons: [ToolbarButton] = [
            .init(type: .filter), .init(type: .refresh)
        ]) {
            self.toolbarButtons = toolbarButtons
        }
    }
    
    public enum Action: Equatable {
        case toolbarButtonPressed(ToolbarButton)
    }
    
    public var body: some ReducerOf<Self> {
        Reduce { _, action in
            switch action {
            case .toolbarButtonPressed:
                // will be handled in TransactionListView.reducer
                return .none
            }
        }
    }
}
