//
//  ToolbarButton.swift
//  WorldOfPayback
//
//  Created by Tsimur Asayonak on 12/23/23.
//

import SwiftUI

struct ToolbarButton: Equatable {
    let uuid = UUID()
    
    var type: ButtonType?
}

extension ToolbarButton {
    enum ButtonType {
        case refresh
        case filter
        
        func getIcon() -> Image {
            switch self {
            case .filter:
                Image(systemName: "slider.horizontal.3")
            case .refresh:
                Image(systemName: "arrow.clockwise")
            }
        }
    }
}
