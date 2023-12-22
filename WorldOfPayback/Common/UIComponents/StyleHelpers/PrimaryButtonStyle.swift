//
//  PrimaryButtonStyle.swift
//  WorldOfPayback
//
//  Created by Tsimur Asayonak on 12/22/23.
//

import Foundation
import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    var size: CGFloat = 16
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(.purple))
            .cornerRadius(size)
    }
}
