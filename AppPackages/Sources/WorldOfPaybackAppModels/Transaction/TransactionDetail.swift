//
//  Created by Tsimur Asayonak on 12/19/23.
//

import Foundation
import WorldOfPaybackAppExtensions

public struct TransactionDetail: Codable, Equatable, Hashable {
    public var description: String?
    public var bookingDate: Date?
    public var value: TransactionValue?
    
    public init(
        description: String? = nil,
        bookingDate: Date? = nil,
        value: TransactionValue? = nil
    ) {
        self.description = description
        self.bookingDate = bookingDate
        self.value = value
    }
}

extension TransactionDetail {
    enum CodingKeys: String, CodingKey {
        case description
        case bookingDate
        case value
    }
}

#if DEBUG
public extension TransactionDetail {
    static func sut() -> Self {
        return .init(
            description: "description",
            bookingDate: DateFormatter.customDateFormatter.date(from: "2023-12-26T11:42:00"),
            value: TransactionValue.sut
        )
    }
}
#endif
