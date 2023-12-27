//
//  Created by Tsimur Asayonak on 12/22/23.
//

import SwiftUI
import WorldOfPaybackAppExtensions

public struct ClearButtonStyle: ButtonStyle {
    var labelColor: Color
    
    public init(labelColor: Color = Color.secondaryColor) {
        self.labelColor = labelColor
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .foregroundStyle(labelColor)
            .frame(maxWidth: .infinity)
    }
}
