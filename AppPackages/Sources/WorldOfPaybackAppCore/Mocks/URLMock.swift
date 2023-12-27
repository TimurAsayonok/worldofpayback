//
//  Created by Tsimur Asayonak on 12/26/23.
//

import Foundation

#if DEBUG
public extension URL {
    static var mock: Self {
        URL(string: "www://url.com")!
    }
}
#endif
