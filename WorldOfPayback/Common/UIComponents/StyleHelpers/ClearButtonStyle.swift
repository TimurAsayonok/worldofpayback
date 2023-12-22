//
//  ClearButtonStyle.swift
//  WorldOfPayback
//
//  Created by Tsimur Asayonak on 12/22/23.
//

import Foundation
import SwiftUI

struct ClearButtonStyle: ButtonStyle {
    var labelColor: Color = .purple
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .foregroundStyle(labelColor)
            .frame(maxWidth: .infinity)
    }
}
