//
//  Created by Tsimur Asayonak on 12/23/23.
//

import SwiftUI

public struct ToolbarButton: Equatable {
    public var uuid: UUID?
    public var type: ButtonType?
    
    public init(uuid: UUID? = UUID(), type: ButtonType) {
        self.uuid = uuid
        self.type = type
    }
}

public extension ToolbarButton {
    enum ButtonType {
        case refresh
        case filter
        
        public func getIcon() -> Image {
            switch self {
            case .filter:
                Image(systemName: "slider.horizontal.3")
            case .refresh:
                Image(systemName: "arrow.clockwise")
            }
        }
    }
}
