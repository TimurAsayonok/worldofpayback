//
//  ToolbarButton.swift
//  WorldOfPayback
//
//  Created by Tsimur Asayonak on 12/23/23.
//

import SwiftUI

struct ToolbarButton: Equatable {
    var uuid: UUID?
    var type: ButtonType?
    
    init(uuid: UUID? = UUID(), type: ButtonType) {
        self.uuid = uuid
        self.type = type
    }
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
