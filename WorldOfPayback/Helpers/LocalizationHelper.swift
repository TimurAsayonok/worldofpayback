//
//  LocalizationHelper.swift
//  WorldOfPayback
//
//  Created by Tsimur Asayonak on 12/22/23.
//

import Foundation

enum L10N {
    static var welcomeScreenTitle = localizedString("welcome_screen_title")
    static var startButtonTitle = localizedString("start_button_title")
}

extension L10N {
     static func localizedString(_ string: String) -> String {
        return NSLocalizedString(string, comment: "")
    }
}
