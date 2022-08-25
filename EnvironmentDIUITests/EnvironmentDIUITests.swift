//
//  EnvironmentDIUITests.swift
//  EnvironmentDIUITests
//
//  Created by Kotaro Fukuo on 2022/08/25.
//

import XCTest
@testable import EnvironmentDI

final class EnvironmentDIUITests: XCTestCase {
    func testExample() throws {
        let app = XCUIApplication()
        continueAfterFailure = false
        app.launchEnvironment = ["EVN":"TEST"]
        app.launch()

        let button = app.buttons["Tap!!!"]
        XCTAssertTrue(button.exists)
        
        button.tap()
        
        XCTAssertTrue(app.staticTexts["This is test"].exists)
    }

}
