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
    var system =  System(time: Date())

    func test_CreateMember() {
        let john = try? Member(name: "Allan",
                              email: "allan@enigma.com",
                              mobilePhone: "123456",
                              ownedItems: [],
                              credits: 0,
                              members: [])

        XCTAssertEqual(john?.id.count, 6)
    }

    func test_createMemberDuplicate() {
        do {
            let allan = try Member(name: "Allan",
                                  email: "allan@enigma.com",
                                  mobilePhone: "123456",
                                  ownedItems: [],
                                  credits: 0,
                                  members: self.system.members)
            self.system.addNewMember(allan)

            let turing = try Member(name: "Turing",
                                  email: "allan@enigma.com",
                                  mobilePhone: "123",
                                  ownedItems: [],
                                  credits: 0,
                                  members: self.system.members)

            self.system.addNewMember(turing)

            let turing2 = try  Member(name: "Turing",
                                      email: "allan@enigma.com",
                                      mobilePhone: "123456",
                                      ownedItems: [],
                                      credits: 0,
                                      members: self.system.members)

            self.system.addNewMember(turing2)

            let allanTest = try? self.system.checkMemberExists(allan.email)
            let turingTest = try? self.system.checkMemberExists(turing.email)
            let turing2Test = try? self.system.checkMemberExists(turing2.email)

            XCTAssertEqual(allanTest, true)
            XCTAssertEqual(turingTest, false)
            XCTAssertEqual(turing2Test, false)
        } catch {
        }
    }
}
