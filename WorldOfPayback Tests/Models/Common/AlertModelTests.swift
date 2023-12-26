//
//  AlertModelTests.swift
//  WorldOfPayback Tests
//
//  Created by Tsimur Asayonak on 12/26/23.
//

@testable import WorldOfPayback_Dev
import XCTest

final class AlertModelTests: XCTestCase {
    func testModel() {
        let stub = AlertModel.stub
        
        XCTAssertEqual(stub.title, L10N.alertTitle)
        XCTAssertEqual(stub.message, "Message")
        XCTAssertEqual(stub.primaryButtonTitle, L10N.okButton)
        XCTAssertEqual(stub.cancelButtonTitle, L10N.cancelButton)
    }
}

extension AlertModel {
    static var stub: Self {
        .init(
            title: L10N.alertTitle,
            message: "Message",
            primaryButtonTitle: L10N.okButton,
            cancelButtonTitle: L10N.cancelButton
        )
    }
}
