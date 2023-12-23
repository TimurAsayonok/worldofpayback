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
