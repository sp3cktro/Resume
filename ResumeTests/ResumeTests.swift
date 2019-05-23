//
//  ResumeTests.swift
//  ResumeTests
//
//  Created by specktro on 5/21/19.
//  Copyright © 2019 specktro. All rights reserved.
//

import XCTest
@testable import Resume

// MARK: - ResumeTests class
class ResumeTests: XCTestCase {
    
    // MARK: - Super class methods
    override func setUp() {
        continueAfterFailure = false
    }
    
    // MARK: - Tests methods
    func testProfileResponse() {
        let expectation = XCTestExpectation(description: NSLocalizedString("Verify profile JSON response", comment: ""))
        
        let failClosure: (NSError) -> () = { error in
            if error.code == 1001 { // There was a service response but the profile was invalid
                expectation.fulfill()
            }
            else {
                XCTFail()
            }
        }
        
        let successClosure: (Profile) -> () = { _ in
            expectation.fulfill()
        }
        
        QueryAPI.shared.getProfile(fail: failClosure, completion: successClosure)
        wait(for: [expectation], timeout: 3.0)
    }
    
    func testProfileIntegrity() {
        let expectation = XCTestExpectation(description: NSLocalizedString("Verify profile JSON integrity", comment: ""))
        
        let failClosure: (NSError) -> () = { error in
            XCTFail()
        }
        
        let successClosure: (Profile) -> () = { _ in
            expectation.fulfill()
        }
        
        QueryAPI.shared.getProfile(fail: failClosure, completion: successClosure)
        wait(for: [expectation], timeout: 3.0)
    }
    
    func testProfileSections() {
        let expectation = XCTestExpectation(description: NSLocalizedString("Verify sections from JSON profile", comment: ""))
        
        let failClosure: (NSError) -> () = { error in
            XCTFail()
        }
        
        let successClosure: (Profile) -> () = { profile in
            if profile.sections.count == 0 {
                XCTFail()
            }
            
            expectation.fulfill()
        }
        
        QueryAPI.shared.getProfile(fail: failClosure, completion: successClosure)
        wait(for: [expectation], timeout: 3.0)
    }
}
