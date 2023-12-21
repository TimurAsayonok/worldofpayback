//
//  BuildConfiguration.swift
//  WorldOfPayback
//
//  Created by Tsimur Asayonak on 12/20/23.
//

import Foundation

class BuildConfiguration {
    static let shared = BuildConfiguration()
    
    var environment: EnvironmentConfiguration
    
    // Api URL based on Environment
    private var apiBasedURLStringL: String {
        switch environment {
        case .development, .staging:
            "https://api-test.payback.com/transactions"
        case .release:
            "https://api.payback.com"
        }
    }
    var apiBasedURL: URL {
        URL(string: apiBasedURLStringL)! // swiftlint:disable:this force_unwrapping
    }
    
    init() {
        guard 
            let currentConfiguration = Bundle.main.object(forInfoDictionaryKey: "Configuration") as? String,
            let environment = EnvironmentConfiguration(rawValue: currentConfiguration)
        else {
            environment = .development
            
            return
        }
        
        self.environment = environment
    }
}
