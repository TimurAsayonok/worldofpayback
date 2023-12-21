//
//  TransactionsListView.swift
//  WorldOfPayback
//
//  Created by Tsimur Asayonak on 12/19/23.
//

import SwiftUI
import ComposableArchitecture

struct TransactionsListView: View {
    var store: StoreOf<TransactionListStore>
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            if viewStore.isLoading {
                ProgressView {
                    VStack {
                        Text("We are loading your Transactions").font(.title2)
                        Text("Friendly reminder: Life if good☺️").font(.footnote)
                    }
                }
            } else {
                ScrollView {
                    VStack {
                        ForEach(viewStore.state.transactionList, id: \.self) { transaction in
                            TransactionView(transaction: transaction)
                                .onTapGesture {
                                    store.send(.transactionItemTapped)
                                }
                        }
                    }
                    .padding(.horizontal, 16)
                }
            }
        }
        .onAppear(perform: {
            store.send(.getTransactionList)
        })
    }
}

struct TransactionListStore: Reducer {
    struct State: Equatable {
        let id = UUID()
        var transactionList: [TransactionModel] = []
        var alertMessage: String?
        var isLoading: Bool = false
//        var loadingState: LoadingProcess = LoadingProcess(state: .loading)
    }
    
    enum Action: Equatable {
        case getTransactionList
        case transactionItemTapped
        case getTransactionListSucceed([TransactionModel])
        case getTransactionListError(ErrorResponse?)
    }
    
    @Dependency(\.apiService) 
    var apiService
    
    var body: some ReducerOf<Self> {
        Reduce<State, Action> { state, action in
            switch action {
            case .getTransactionList:
                state.isLoading = true
                return .run { send in
                    let response = try await apiService.getTransactionList()
                    await send(.getTransactionListSucceed(response))
                } catch: { error, send in
                    await send(.getTransactionListError(error as? ErrorResponse))
                }

            case .transactionItemTapped:
                print("transactionItemTapped")
                return .none
                
            case .getTransactionListSucceed:
                state.isLoading = false
                return .none
            
            case let .getTransactionListError(error):
                state.isLoading = false
                print("Error:", error?.localizedDescription)
//                guard let errorMessage = error.lo else {
//                    return .none
//                }
                
                state.transactionList = TransactionModel.mockedList()
                return .none
            }
        }
    }
}

enum LoadingState {
    case idle
    case loading
    case failed(Error)
    case loaded
}

protocol LoadableObject: ObservableObject{
    var state: LoadingState { get }
    func load()
}

class LoadingProcess: LoadableObject {
    var state: LoadingState
    
    init(state: LoadingState) {
        self.state = state
    }
    
    func load() {}
}

struct AsyncContentView<Source: LoadableObject, Content: View>: View {
    @ObservedObject var source: Source
    var content: () -> Content
    
    init(source: Source, @ViewBuilder content: @escaping () -> Content) {
        self.source = source
        self.content = content
    }
    
    var body: some View {
        switch source.state {
        case .idle:
            Color.clear.onAppear(perform: source.load)
        case .loading:
            ProgressView()
        case .failed(let error):
            ErrorView(error: error)
        case .loaded:
            content()
        }
    }
}

struct ErrorView: View {
    var error: Error
    
    var body: some View {
        Text("Error")
    }
}
