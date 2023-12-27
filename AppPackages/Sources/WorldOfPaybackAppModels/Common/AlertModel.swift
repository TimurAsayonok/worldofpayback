//
//  AlertModel.swift
//  WorldOfPayback
//
//  Created by Tsimur Asayonak on 12/21/23.
//

import Foundation
import LocalizationStrings

public struct AlertModel: Equatable {
    public var title: String
    public var message: String?
    public var primaryButtonTitle: String?
    public var cancelButtonTitle: String?
    
    public init(
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
