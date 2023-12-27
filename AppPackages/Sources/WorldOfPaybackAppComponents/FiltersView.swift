//
//  FiltersView.swift
//  WorldOfPayback
//
//  Created by Tsimur Asayonak on 12/22/23.
//

import SwiftUI
import ComposableArchitecture
import WorldOfPaybackModels
import LocalizationStrings

public struct FiltersView: View {
    var store: StoreOf<FiltersStore>
    
    public init(store: StoreOf<FiltersStore>) {
        self.store = store
    }
    
    public var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text(L10N.filterSortByTitle)
                        .font(.headline)
                    HStack {
                        Button(L10N.filterSortDateDescending) {
                            viewStore.send(.selectFilter(.byDate(.descending)))
                        }
                        .buttonStyle(OutlineButtonStyle())
                        
                        Button(L10N.filterSortDateAscending) {
                            viewStore.send(.selectFilter(.byDate(.ascending)))
                        }
                        .buttonStyle(OutlineButtonStyle())
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text(L10N.filterCategoryTitle)
                        .font(.headline)
                    
                    HStack {
                        ForEach(1..<4) { number in
                            Button("\(number)") {
                                viewStore.send(.selectFilter(.category(number)))
                            }
                            .buttonStyle(OutlineButtonStyle(color: .gray))
                        }
                    }
                    
                    Button(L10N.clearButton) {
                        viewStore.send(.selectFilter(nil))
                    }
                    .buttonStyle(ClearButtonStyle(labelColor: .purple))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
        }
    }
}

public struct FiltersStore: Reducer {
    public struct State: Equatable {
        public init() {}
    }
    
    public enum Action: Equatable {
        case selectFilter(FilterType?)
    }
    
    public var body: some ReducerOf<Self> {
        Reduce { _, action in
            switch action {
            case .selectFilter:
                // will be handled in TransactionListView.reducer
                return .none
            }
        }
    }
}
