//
//  pesel_validatorTests.swift
//  pesel validatorTests
//
//  Created by Maciej Dubowik on 04/03/2023.
//

import XCTest
@testable import pesel_validator

final class pesel_validatorTests: XCTestCase {

//    override func setUpWithError() throws {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }
//
//    func testExample() throws {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//        // Any test you write for XCTest can be annotated as throws and async.
//        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
//        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
//    }
//
//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
    
    func testTextFieldisEmpty(){
        let pesel = ViewController()
        let result = pesel.checkPesel("")
        XCTAssertEqual(result.message, "The PESEL must consist of 11 digits")
        XCTAssertFalse(result.status)
    }
    
    func testPeselHasInvalidChecksum(){
    let pesel = ViewController()
    let result = pesel.checkPesel("94011041831")
    XCTAssertFalse(result.status)
    }
    
    func testTextFieldConsistLessThan11Digits(){
        let pesel = ViewController()
        let result = pesel.checkPesel("1232143")
        XCTAssertEqual(result.message, "The PESEL must consist of 11 digits")
        XCTAssertFalse(result.status)
    }
    func testTextFieldContainsOnlyDigits(){
        let peseltextField = UITextField()
        peseltextField.text = "12345678912"
        print(peseltextField.text!)
        XCTAssertTrue(peseltextField.text?.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil, "Text field should only contain digits")

    }
    
    func testPeselIsValid(){
        let pesel = ViewController()
        let result = pesel.checkPesel("94111041838")
        XCTAssertTrue(result.status)
    }
    func testPeselIsNotValid(){
        let pesel = ViewController()
        let result = pesel.checkPesel("55011828643")
        XCTAssertFalse(result.status)
    }
    func testIsMan(){
        let pesel = ViewController()
        let result = pesel.getGender([5,1,0,7,2,6,4,0,3,1,5])
        XCTAssertEqual(result, "man")
    }
    func testIsWoman(){
        let pesel = ViewController()
        let result = pesel.getGender([0,1,2,8,0,7,0,3,4,0,9])
        XCTAssertEqual(result, "woman")
    }
    func testBornIn7August2001(){
        let pesel = ViewController()
        let result = pesel.getDate([0,1,2,8,0,7,0,3,4,0,9])
        XCTAssertEqual(result, "2001-08-07")
    }
    func testIsManBornIn24November1948(){
        let pesel = ViewController()
        let date = pesel.getDate([4,8,1,1,2,4,6,2,3,5,4])
        let gender = pesel.getGender([4,8,1,1,2,4,6,2,3,5,4])
        XCTAssertEqual(date, "1948-11-24")
        XCTAssertEqual(gender, "man")
    }
    
    

}
