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
    
    static var transactionListTitle = localizedString("transaction_list_title")
    static var transactionListTotalAmount = localizedString("transaction_list_total_amount") 
    static var transactionListEmptyTitle = localizedString("transaction_list_empty_title")
    static var transactionListEmptyDescription = localizedString("transaction_list_empty_description")
    
    static var filterSortByTitle = localizedString("filter_sort_by_title")
    static var filterSortDateDescending = localizedString("filter_sort_date_descending")
    static var filterSortDateAscending = localizedString("filter_sort_date_ascending")
    static var filterCategoryTitle = localizedString("filter_category_title")
    
    static var closeButton = localizedString("close_button")
    static var clearButton = localizedString("clear_button")
    static var cancelButton = localizedString("cancel_button")
    static var okButton = localizedString("ok_button")
    
    static var alertTitle = localizedString("alert_title")
}

extension L10N {
     static func localizedString(_ string: String) -> String {
        return NSLocalizedString(string, comment: "")
    }
}
