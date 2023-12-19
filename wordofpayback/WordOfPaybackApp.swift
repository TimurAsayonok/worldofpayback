//
//  wordofpaybackApp.swift
//  wordofpayback
//
//  Created by Tsimur Asayonak on 12/18/23.
//

import SwiftUI
import ComposableArchitecture

@main
struct WordOfPaybackApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            CoordinatorView(store: Store(initialState: .initialState, reducer: {
                Coordinator()
            }))
            .safeAreaPadding(16)
        }
    }
}
