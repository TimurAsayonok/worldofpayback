//
//  AlertModelTests.swift
//  WorldOfPayback Tests
//
//  Created by Tsimur Asayonak on 12/26/23.
//

import LocalizationStrings
import WorldOfPaybackAppModels
import XCTest

final class AlertModelTests: XCTestCase {
    func testModel() {
        let sut = AlertModel.sut()
        
        XCTAssertEqual(sut.title, L10N.alertTitle)
        XCTAssertEqual(sut.message, "Message")
        XCTAssertEqual(sut.primaryButtonTitle, L10N.okButton)
        XCTAssertEqual(sut.cancelButtonTitle, L10N.cancelButton)
    }
}

extension AlertModel {
    static func sut(message: String? = "Message") -> Self {
        .init(
            title: L10N.alertTitle,
            message: message,
            primaryButtonTitle: L10N.okButton,
            cancelButtonTitle: L10N.cancelButton
        )
    }
}
