//
//  wordofpaybackApp.swift
//  WorldOfPayback
//
//  Created by Tsimur Asayonak on 12/18/23.
//

import SwiftUI
import ComposableArchitecture
import WorldOfPaybackAppComponents
import WorldOfPaybackAppCoordinator
import WorldOfPaybackAppServices

@main
struct WordOfPaybackApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
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
