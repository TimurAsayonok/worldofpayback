//
//  OutlineButtonStyle.swift
//  WorldOfPayback
//
//  Created by Tsimur Asayonak on 12/22/23.
//

import Foundation
import SwiftUI

struct OutlineButtonStyle: ButtonStyle {
    var color: Color = .purple
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .foregroundStyle(color)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(
                    cornerRadius: 16,
                    style: .continuous
                )
                .stroke(color, lineWidth: 2)
            )
    }
}
