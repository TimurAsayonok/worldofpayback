//
//  TransactionListStoreTests.swift
//  WorldOfPayback Tests
//
//  Created by Tsimur Asayonak on 12/26/23.
//

@testable import WorldOfPayback_Dev
import ComposableArchitecture
import XCTest

@MainActor
final class TransactionListStoreTests: XCTestCase {
    func testGetTransactionList() async {
        let store = TestStore(initialState: TransactionListStore.State()) {
            TransactionListStore()
        } withDependencies: {
            $0.apiService = ApiServiceKey.testValue
        }
        
        await store.send(.initScreen)
        await store.receive(.getTransactionList) {
            $0.isLoading = true
        }
        
        let transactionList: [TransactionModel] = [.sut()]
        await store.receive(.getTransactionListSucceed(transactionList), timeout: Duration.seconds(5)) { state in
            state.isLoading = false
            state.filteredType = .byDate(.descending)
            state.transactionList = transactionList
        }
    }
    
    func testToolbarFilterButton() async {
        let store = TestStore(initialState: TransactionListStore.State()) {
            TransactionListStore()
        }
        
        await store.send(.toolbarButtonsAction(.toolbarButtonPressed(.init(type: .filter))))
        await store.receive(.presentFilterView(true), timeout: Duration.seconds(1)) {
            $0.isFilterViewPresented = true
        }
        await store.send(.filtersAction(.selectFilter(.category(1)))) {
            $0.filteredType = .category(1)
        }
        await store.receive(.presentFilterView(false)) {
            $0.isFilterViewPresented = false
        }
    }
    
    func testToolbarRefreshButton() async {
        let store = TestStore(initialState: TransactionListStore.State()) {
            TransactionListStore()
        } withDependencies: {
            $0.apiService = ApiServiceKey.testValue
        }
        
        await store.send(.toolbarButtonsAction(.toolbarButtonPressed(.init(type: .refresh))))
        await store.receive(.getTransactionList) {
            $0.isLoading = true
        }
        
        let transactionList: [TransactionModel] = [.sut()]
        await store.receive(.getTransactionListSucceed(transactionList), timeout: Duration.seconds(5)) { state in
            state.isLoading = false
            state.filteredType = .byDate(.descending)
            state.transactionList = transactionList
        }
    }
    
    func testTransactionButton() async {
        let store = TestStore(initialState: TransactionListStore.State()) {
            TransactionListStore()
        }
        
        await store.send(.transactionItemTapped(TransactionModel.sut()))
    }
}
