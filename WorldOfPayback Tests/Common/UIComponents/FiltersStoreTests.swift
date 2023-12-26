//
//  FiltersStoreTests.swift
//  WorldOfPayback Tests
//
//  Created by Tsimur Asayonak on 12/26/23.
//

@testable import WorldOfPayback_Dev
import XCTest
import ComposableArchitecture

@MainActor
final class FiltersStoreTests: XCTestCase {
    func testStore() async {
        let store = TestStore(initialState: FiltersStore.State()) {
            FiltersStore()
        }
        
        // this action do nothing for the sate, because will be handled in parent store
        await store.send(.selectFilter(.category(1)))
    }
}
