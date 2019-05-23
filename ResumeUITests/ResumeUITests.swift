//
//  ResumeUITests.swift
//  ResumeUITests
//
//  Created by specktro on 5/21/19.
//  Copyright © 2019 specktro. All rights reserved.
//

import XCTest

// MARK: - ResumeUITests class
class ResumeUITests: XCTestCase {
    // MARK: - Attributes
    let app = XCUIApplication()
    
    // MARK: - Super class methods
    override func setUp() {
        continueAfterFailure = false
        app.launch()
    }

    // MARK: - Tests methods
    func testMinimumSections() {
        XCTAssertTrue(app.tables.staticTexts["About"].exists || app.tables.staticTexts["Summary"].exists)
        XCTAssertTrue(app.tables.staticTexts["Experience"].exists)
        XCTAssertTrue(app.tables.staticTexts["Education"].exists || app.tables.staticTexts["Academic"].exists)
    }
    
    func testMinimumCellsCount() {
        let numberOfCells = app.tables.cells.count
        XCTAssertGreaterThanOrEqual(numberOfCells, 3)
    }
}
