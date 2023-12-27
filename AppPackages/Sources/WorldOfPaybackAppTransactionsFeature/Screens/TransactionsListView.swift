//
//  TransactionsListView.swift
//  WorldOfPayback
//
//  Created by Tsimur Asayonak on 12/19/23.
//

import SwiftUI
import ComposableArchitecture
import WorldOfPaybackAppModels
import WorldOfPaybackAppComponents
import LocalizationStrings

public struct TransactionsListView: View {
    var store: StoreOf<TransactionListStore>
    
    public init(store: StoreOf<TransactionListStore>) {
        self.store = store
    }
    
    public var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            VStack {
                if viewStore.state.transactionList.isEmpty {
                    emptyView()
                } else {
                    ScrollView {
                        Text("\(L10N.transactionListTotalAmount) \(viewStore.state.totalAmount)")
                            .font(.callout)
                            .bold()
                        
                        VStack(alignment: .leading) {
                            ForEach(viewStore.state.filteredList, id: \.self.alias?.reference) { transaction in
                                TransactionView(transaction: transaction)
                                    .onTapGesture {
                                        store.send(.transactionItemTapped(transaction))
                                    }
                            }
                        }
                        .padding(.horizontal, 16)
                    }
                }
            }
            .navigationTitle(L10N.transactionListTitle)
            .toolbar {
                if viewStore.state.isLoading {
                    ProgressView()
                } else {
                    IfLetStore(
                        self.store.scope(
                            state: { $0.toolbarButtonsState },
                            action: TransactionListStore.Action.toolbarButtonsAction
                        )
                    ) { store in
                        MainToolbarView(store: store)
                    }
                }
            }
            .alert(isPresented: viewStore.binding(
                get: { $0.alertModel != nil },
                send: { _ in .closeAlertAndRefresh }
            )) {
                Alert(
                    title: Text(viewStore.state.alertModel?.title ?? ""),
                    message: Text(viewStore.state.alertModel?.message ?? ""),
                    dismissButton: .cancel(Text(L10N.closeButton))
                )
            }
            .sheet(isPresented: viewStore.binding(
                get: { $0.isFilterViewPresented },
                send: { .presentFilterView($0) }
            )) {
                IfLetStore(
                    self.store.scope(state: { $0.filtersState }, action: TransactionListStore.Action.filtersAction)
                ) { store in
                    FiltersView(store: store)
                    .padding()
                    .presentationDetents([.fraction(0.45)])
                }
            }
        }
        .navigationBarBackButtonHidden()
        .onAppear(perform: {
            store.send(.initScreen)
        })
    }
    
    @ViewBuilder
    private func emptyView() -> some View {
        VStack {
            Text(L10N.transactionListEmptyTitle).font(.title2)
            Text(L10N.transactionListEmptyDescription).font(.footnote)
        }
    }
}

public struct TransactionListStore: Reducer {
    public struct State: Equatable {
        var filtersState: FiltersStore.State
        var toolbarButtonsState: MainToolbarStore.State
        
        public var transactionList: [TransactionModel]
        public var isLoading = false
        public var filteredType: FilterType?
        public var alertModel: AlertModel?
        public var isFilterViewPresented = false
        
        var filteredList: [TransactionModel] {
            let sorting: (ComparisonResult) -> [TransactionModel] = { comparison in
                transactionList.sorted(by: {
                    let leftDate = $0.transactionDetail?.bookingDate
                    let rightDate = $1.transactionDetail?.bookingDate
                    return leftDate?.compare(rightDate ?? Date()) == comparison
                })
            }
            switch filteredType {
            case .byDate(.descending):
                return sorting(.orderedDescending)
            case .byDate(.ascending):
                return sorting(.orderedAscending)
            case .category(let number):
                return transactionList.filter { $0.category == number }
            default:
                return transactionList
            }
        }
        
        var totalAmount: Int {
            filteredList.reduce(0, { $0 + ($1.transactionDetail?.value?.amount ?? 0) })
        }
        
        public init(
            transactionList: [TransactionModel] = [],
            isLoading: Bool = false,
            alertModel: AlertModel? = nil,
            isFilterViewPresented: Bool = false,
            filteredType: FilterType? = nil,
            filtersState: FiltersStore.State = FiltersStore.State(),
            toolbarButtonsState: MainToolbarStore.State = MainToolbarStore.State()
        ) {
            self.transactionList = transactionList
            self.isLoading = isLoading
            self.alertModel = alertModel
            self.isFilterViewPresented = isFilterViewPresented
            self.filteredType = filteredType
            self.filtersState = filtersState
            self.toolbarButtonsState = toolbarButtonsState
        }
    }
    
    public enum Action: Equatable {
        case initScreen
        case getTransactionList
        case transactionItemTapped(TransactionModel)
        case getTransactionListSucceed([TransactionModel])
        case getTransactionListError(ErrorResponse?)
        case closeAlertAndRefresh
        case filtersAction(FiltersStore.Action)
        case toolbarButtonsAction(MainToolbarStore.Action)
        case presentFilterView(Bool)
    }
    
    @Dependency(\.apiService) var apiService
    
    public var body: some ReducerOf<Self> {
        Reduce<State, Action> { state, action in
            switch action {
            case .initScreen:
                guard state.transactionList.isEmpty else {
                    return .none
                }
                
                return .send(.getTransactionList)
                
            case .getTransactionList:
                state.isLoading = true
                
                return .run { send in
                    let response = try await apiService.getTransactionList()
                    await send(.getTransactionListSucceed(response))
                } catch: { error, send in
                    await send(.getTransactionListError(error as? ErrorResponse))
                }

            case .transactionItemTapped:
                // will be handled in Coordinator.Reducer
                return .none
                
            case let .getTransactionListSucceed(items):
                state.isLoading = false
                state.transactionList = items
                state.filteredType = .byDate(.descending)
                state.alertModel = nil
                return .none
            
            case let .getTransactionListError(error):
                state.isLoading = false
                state.alertModel = AlertModel(message: error?.localizedDescription)
                return .none
                
            case .closeAlertAndRefresh:
                state.alertModel = nil
                return .send(.getTransactionList)
                
            case let .presentFilterView(present):
                state.isFilterViewPresented = present
                return .none
                
            case let .filtersAction(.selectFilter(filterType)):
                state.filteredType = filterType
                return .send(.presentFilterView(false))
                
            case let .toolbarButtonsAction(.toolbarButtonPressed(button)):
                switch button.type {
                case .refresh:
                    return .send(.getTransactionList)
                case .filter:
                    return .send(.presentFilterView(true))
                case .none:
                    return .none
                }
            }
        }
    }
    
    public init() {}
}
