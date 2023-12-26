//
//  BuildConfiguration.swift
//  WorldOfPayback
//
//  Created by Tsimur Asayonak on 12/20/23.
//

import Foundation

protocol BuildConfigurationProtocol {
    var apiBasedUrl: URL { get }
}

class BuildConfiguration: BuildConfigurationProtocol {
    var apiBasedUrl: URL {
        URL(string: apiBasedURLStringL)! // swiftlint:disable:this force_unwrapping
    }
    
    static let shared = BuildConfiguration()
    
    var environment: EnvironmentConfiguration
    
    // Api URL based on Environment
    private var apiBasedURLStringL: String {
        switch environment {
        case .development, .staging:
            "https://api-test.payback.com"
        case .release:
            "https://api.payback.com"
        }
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
