//
//  Created by Tsimur Asayonak on 12/26/23.
//

import Foundation

#if DEBUG
public class BuildConfigurationProtocolMock: BuildConfigurationProtocol {
    public var apiBasedUrl: URL {
        URL(string: "https://api-test.payback.com")!
    }
    
    public init() {}
}
#endif
