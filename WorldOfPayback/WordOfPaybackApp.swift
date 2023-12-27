//
//  wordofpaybackApp.swift
//  WorldOfPayback
//
//  Created by Tsimur Asayonak on 12/18/23.
//

import SwiftUI
import ComposableArchitecture
import WorldOfPaybackAppComponents

@main
struct WordOfPaybackApp: App {
    @StateObject private var networkMonitor = NetworkMonitor()
    
    var body: some Scene {
        WindowGroup {
            if networkMonitor.isConnected {
                CoordinatorView(store: Store(initialState: .initialState, reducer: {
                    Coordinator()
                }))
                .safeAreaPadding(16)
            } else {
                NetworkUnavailableView()
            }
        }
    }
}
