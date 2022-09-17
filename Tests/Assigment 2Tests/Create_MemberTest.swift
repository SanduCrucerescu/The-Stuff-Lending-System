//
//  Create_Member.swift
//  
//
//  Created by Alex on 2022-09-17.
//

import XCTest
@testable import Assigment_2

final class CreateMember: XCTestCase {
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
//        // Mark your test async to allow awaiting for asynchronous
//         code to complete. Check the results with assertions afterwards.
//    }
//
//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
    func test_createMember() {
        do {
            let john = try Member(name: "Allan",
                                  email: "test",
                                  mobilePhone: "123456",
                                  ownedItems: [],
                                  credits: 0,
                                  members: [])

            let john1 = try Member(name: "Allan",
                                  email: "test",
                                  mobilePhone: "123456",
                                  ownedItems: [],
                                  credits: 0,
                                  members: [])

            XCTAssertEqual(john.name, "Allan")
            XCTAssertEqual(john.email, "test")
            XCTAssertEqual(john.mobilePhone, "123456")
            XCTAssertEqual(john.ownedItems, [])
        } catch {
        }
    }
}
