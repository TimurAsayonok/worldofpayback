//
//  AppDelegate.swift
//  WorldOfPayback
//
//  Created by Tsimur Asayonak on 12/18/23.
//

import UIKit
import WorldOfPaybackAppCore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        print("Current configuration: \(BuildConfiguration.shared.environment)")
        return true
    }
}
