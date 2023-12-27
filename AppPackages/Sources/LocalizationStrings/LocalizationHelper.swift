//
//  Created by Tsimur Asayonak on 12/27/23.
//

import Foundation

public enum L10N {
    public static var welcomeScreenTitle = localizedString("welcome_screen_title")
    public static var startButtonTitle = localizedString("start_button_title")
    public static var welcomeScreenMessage = localizedString("welcome_screen_message")

    public static var transactionListTitle = localizedString("transaction_list_title")
    public static var transactionListTotalAmount = localizedString("transaction_list_total_amount")
    public static var transactionListEmptyTitle = localizedString("transaction_list_empty_title")
    public static var transactionListEmptyDescription = localizedString("transaction_list_empty_description")
    
    public static var filterSortByTitle = localizedString("filter_sort_by_title")
    public static var filterSortDateDescending = localizedString("filter_sort_date_descending")
    public static var filterSortDateAscending = localizedString("filter_sort_date_ascending")
    public static var filterCategoryTitle = localizedString("filter_category_title")
    
    public static var closeButton = localizedString("close_button")
    public static var clearButton = localizedString("clear_button")
    public static var cancelButton = localizedString("cancel_button")
    public static var okButton = localizedString("ok_button")
    
    public static var alertTitle = localizedString("alert_title")
}

extension L10N {
     static func localizedString(_ string: String) -> String {
         return NSLocalizedString(string, bundle: .module, comment: "")
    }
}
