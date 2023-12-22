//
//  AlertModel.swift
//  WorldOfPayback
//
//  Created by Tsimur Asayonak on 12/21/23.
//

import Foundation

struct AlertModel: Equatable {
    var title: String
    var message: String?
    var primaryButtonTitle: String?
    var cancelButtonTitle: String?
    
    init(
        title: String = L10N.alertTitle,
        message: String? = nil,
        primaryButtonTitle: String? = L10N.okButton,
        cancelButtonTitle: String? = L10N.cancelButton
    ) {
        self.title = title
        self.message = message
        self.primaryButtonTitle = primaryButtonTitle
        self.cancelButtonTitle = cancelButtonTitle
    }
}
