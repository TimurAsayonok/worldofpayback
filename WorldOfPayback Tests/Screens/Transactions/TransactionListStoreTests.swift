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
//    func testStore() async {
//        let testDate = Date()
//        
//        let store = TestStore(initialState: TransactionListStore.State()) {
//            TransactionListStore()
//        } withDependencies: {
//            $0.apiService = ApiService.sut()
//        }
//        
//        await store.send(.presentFilterView(true)) { state in
//            state.isFilterViewPresented = true
//        }
//        
//        
////        await store.dependencies.apiService.getTransactionList()
//        
////        await store.receive(
////            .getTransactionListSucceed([TransactionModel.sut(date: testDate)]), timeout: Duration.seconds(1)
////        ) { state in
////            state.isLoading = false
////        }
//    }
    
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
        }
        store.dependencies.apiService = .testValue
        
        await store.send(.toolbarButtonsAction(.toolbarButtonPressed(.init(type: .refresh))))
        await store.receive(.getTransactionList) {
            $0.isLoading = true
        }
        
        let testList = [TransactionModel.sut(date: Date())]
        await store.receive(.getTransactionListSucceed(testList), timeout: Duration.seconds(5)) { state in
            state.transactionList = testList
        }
//        do {
//            let transactionList = try await store.dependencies.apiService.getTransactionList()
//            await store.receive(
//                .getTransactionListSucceed([TransactionModel.sut(date: Date())]), timeout: Duration.seconds(1)
//            ) {
//                $0.isLoading = false
//                $0.transactionList = []
//            }
//        } catch {
//            
//        }
    }
}
