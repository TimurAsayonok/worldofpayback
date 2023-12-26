//
//  TransactionDetailsStoreTests.swift
//  WorldOfPayback Tests
//
//  Created by Tsimur Asayonak on 12/26/23.
//

@testable import WorldOfPayback_Dev
import ComposableArchitecture
import XCTest

@MainActor
final class TransactionDetailsStoreTests: XCTestCase {
    func testStore() async {
        let state = TransactionDetailsStore.State(transaction: TransactionModel.sut())
        let store = TestStore(initialState: state) {
            TransactionDetailsStore()
        }
        
        XCTAssertNotNil(store.state.transaction)
    }
}
