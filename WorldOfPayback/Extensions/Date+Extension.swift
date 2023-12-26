//
//  Date+Extension.swift
//  WorldOfPayback
//
//  Created by Tsimur Asayonak on 12/23/23.
//

import Foundation

extension Date {
    var timestamp: String {
        let dataFormatter = DateFormatter()
        dataFormatter.setLocalizedDateFormatFromTemplate("dd/MM/YYYY")
        
        return String(format: "%@", dataFormatter.string(from: self))
    }
}

extension DateFormatter {
    static var customDateFormatter: Self {
        let dataFormatter = Self()
        dataFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        dataFormatter.timeZone = TimeZone.current
        dataFormatter.locale = Locale.current
        
        return dataFormatter
    }
}
