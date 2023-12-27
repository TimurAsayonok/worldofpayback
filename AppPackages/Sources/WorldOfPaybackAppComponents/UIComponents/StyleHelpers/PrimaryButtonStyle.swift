//
//  PrimaryButtonStyle.swift
//  WorldOfPayback
//
//  Created by Tsimur Asayonak on 12/22/23.
//

import Foundation
import SwiftUI

public struct PrimaryButtonStyle: ButtonStyle {
    var size: CGFloat
    
    public init(size: CGFloat = 16) {
        self.size = size
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(red: 0.36, green: 0.26, blue: 0.78))
            .cornerRadius(size)
    }
}
