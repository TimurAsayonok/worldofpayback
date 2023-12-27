//
//  NetworkUnavailableView.swift
//  WorldOfPayback
//
//  Created by Tsimur Asayonak on 12/27/23.
//

import SwiftUI
import LocalizationStrings

public struct NetworkUnavailableView: View {
    public init() {}
    
    public var body: some View {
        ContentUnavailableView(
            L10N.noInternetConnectionTitle,
            systemImage: "wifi.exclamationmark",
            description: Text(L10N.noInternetConnectionDescription)
        )
    }
}

#Preview {
    NetworkUnavailableView()
}
