//
//  ApiServiceMock.swift
//  WorldOfPayback Tests
//
//  Created by Tsimur Asayonak on 12/26/23.
//

@testable import WorldOfPayback_Dev
import Foundation

extension DependencyValues {
    var apiServiceMock: ApiService {
      get { self[ApiService.self] }
      set { self[ApiService.self] = newValue }
    }
}
