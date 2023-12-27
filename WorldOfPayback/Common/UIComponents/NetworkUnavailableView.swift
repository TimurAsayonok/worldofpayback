//
//  NetworkUnavailableView.swift
//  WorldOfPayback
//
//  Created by Tsimur Asayonak on 12/27/23.
//

import SwiftUI

struct NetworkUnavailableView: View {
    var body: some View {
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
