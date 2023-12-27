//
//  ToolbarButton.swift
//  WorldOfPayback
//
//  Created by Tsimur Asayonak on 12/23/23.
//

import SwiftUI

public struct ToolbarButton: Equatable {
    var uuid: UUID?
    var type: ButtonType?
    
    public init(uuid: UUID? = UUID(), type: ButtonType) {
        self.uuid = uuid
        self.type = type
    }
}

public extension ToolbarButton {
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
