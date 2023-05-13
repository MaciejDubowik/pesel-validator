//
//  PeselValidatorTests.swift
//  pesel validatorTests
//
//  Created by Maciej Dubowik on 13/05/2023.
//

import XCTest
@testable import pesel_validator

final class PeselValidatorTests: XCTestCase {
    
    func testCheckPesel_WhenChecksumIsValid_ReturnsTrue(){
        let checkPesel = PeselValidator(peselValue: [9,4,1,1,1,0,4,1,8,3,8]).checkPesel()
        XCTAssertTrue(checkPesel.status)
    }
    
    func testCheckPesel_WhenChecksumIsInvalid_ReturnsFalse(){
        let checkPesel = PeselValidator(peselValue: [9,4,0,1,1,0,4,1,8,3,1]).checkPesel()
        XCTAssertFalse(checkPesel.status)
    }
    
    func testCheckPesel_WhenPeselIsTooShort_ReturnsMessage(){
        let checkPesel = PeselValidator(peselValue: [9,4,0,1,1,0]).checkPesel()
        XCTAssertEqual(checkPesel.message, "The PESEL must consist of 11 digits")
    }
    
    func testCheckPesel_WhenPeselIsTooLong_ReturnsMessage(){
        let checkPesel = PeselValidator(peselValue: [9,4,0,1,1,0,4,1,8,3,1,1,2,3,4,5]).checkPesel()
        XCTAssertEqual(checkPesel.message, "The PESEL must consist of 11 digits")
    }
    
    func testCheckPesel_WhenPeselisEmpty_ReturnsMessage(){
        let checkPesel = PeselValidator(peselValue: []).checkPesel()
        XCTAssertEqual(checkPesel.message, "The PESEL must consist of 11 digits")
    }
    
    func testGetGender_ReturnsMale(){
        let getGender = PeselValidator(peselValue: [5,1,0,7,2,6,4,0,3,1,5]).getGender()
        XCTAssertEqual(getGender, "male")
      }
    
    func testGetGender_ReturnsFemale(){
        let getGender = PeselValidator(peselValue: [0,1,2,8,0,7,0,3,4,0,9]).getGender()
        XCTAssertEqual(getGender, "female")
    }
    
      func testGetDate_Returns7August2001(){
          let getDate = PeselValidator(peselValue: [0,1,2,8,0,7,0,3,4,0,9]).getDate()
          XCTAssertEqual(getDate, "2001-08-07")
      }
}
