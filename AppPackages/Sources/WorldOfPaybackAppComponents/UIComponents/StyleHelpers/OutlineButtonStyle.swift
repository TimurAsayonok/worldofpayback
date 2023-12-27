//
//  Created by Tsimur Asayonak on 12/22/23.
//

import SwiftUI
import WorldOfPaybackAppExtensions

public struct OutlineButtonStyle: ButtonStyle {
    var color: Color
    
    public init(color: Color = Color.secondaryColor) {
        self.color = color
    }
    
    public func makeBody(configuration: Configuration) -> some View {
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
