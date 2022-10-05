//
//  Create_Member.swift
//  
//
//  Created by Alex on 2022-09-17.
//

import XCTest
@testable import Assigment_2

final class UnitTests: XCTestCase {
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
    var system =  System(day: 0)

    func test_CreateMember() {
        let john = try? Member(name: "Allan",
                              email: "allan@enigma.com",
                              mobilePhone: "123456",
                              members: [])

        XCTAssertEqual(john?.id.count, 6)
    }

    func test_createMemberDuplicate() {
        do {
            let allan = try Member(name: "Allan",
                                  email: "allan@enigma.com",
                                  mobilePhone: "123456",
                                  members: self.system.members)
            self.system.addNewMember(allan)

            let turing = try Member(name: "Turing",
                                  email: "allan@enigma.com",
                                  mobilePhone: "123",
                                  members: self.system.members)

            self.system.addNewMember(turing)

            let turing2 = try  Member(name: "Turing",
                                      email: "allan@enigma.com",
                                      mobilePhone: "123456",
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

    func test_checkArray() {
        do {
            let turing2 = try Member(name: "Turing",
                                     email: "allan1@enigma.com",
                                     mobilePhone: "123454",
                                     members: self.system.members)

            self.system.addNewMember(turing2)
            let numb = self.system.members.count

            XCTAssertEqual(numb, 3)
        } catch {}
    }

    func test_checkItems() {
        let car =   try? Item(owner: self.system.members[0],
                           name: "Car",
                           description: "It's fun to play with",
                           creationDate: self.system.day,
                           category: Item.Category.toy,
                           costPerDay: "50",
                           items: self.system.items)

        self.system.createItem(self.system.members[0], car!)

        var exists = false
        for member in self.system.members where member.ownedItems == 2 {
            exists = true
        }

        XCTAssertEqual(exists, true)
    }

    func test_checkItemsNil() {
        var exists = false
        for member in self.system.members where member.ownedItems == 0 {
            exists = true
        }

        XCTAssertEqual(exists, true)
    }

    func test_checkContractFree() {
        let contract = Contract(id: UUID().uuidString,
                                lendee: self.system.members[1],
                                startDay: 5,
                                endDay: 7,
                                cost: 30)
        let id = self.system.items.first?.id
        self.system.createContract(id!, contract)

        var exists = false

        for item in self.system.items {
            exists = self.system.checkItemFree(item.id, 5, 7)
        }

        XCTAssertEqual(exists, false)

    }

    func test_CreateItem() {
        let car =   try? Item(owner: self.system.members[0],
                                  name: "Car",
                                  description: "It's fun to play with",
                                  creationDate: self.system.day,
                                  category: Item.Category.toy,
                                  costPerDay: "50",
                                  items: self.system.items)

        self.system.createItem(self.system.members[0], car!)

        let credits = self.system.members[0].credits

        XCTAssertEqual(credits, 200)

    }

    func test_DeleteItem() {
        let id = self.system.items[0].id
        let item = self.system.items[0]

        do {
            try self.system.removeItem(id)
            let exists = self.system.items.contains(where: {$0.id == id})
            XCTAssertEqual(item.isAvalible, true)
            XCTAssertEqual(exists, false)
        } catch ItemParseError.itemHasAnActiveContract {
            XCTAssertEqual(item.isAvalible, false)
        } catch {}
    }

    func test_CreateContract() {
        let itemID = self.system.items[0].id
        let member = self.system.members[1]

        let contract = Contract(id: UUID().uuidString,
                                lendee: member,
                                startDay: 1,
                                endDay: 3,
                                cost: 20)
        self.system.createContract(itemID, contract)

        let exists = self.system.items.first(where: {$0.id == itemID})?
            .contracts.contains(where: {$0.id == contract.id})

        XCTAssertEqual(exists, true)
    }

    func test_CreateContract2() {
        let car =   try? Item(owner: self.system.members[0],
                                  name: "Car",
                                  description: "It's fun to play with",
                                  creationDate: self.system.day,
                                  category: Item.Category.toy,
                                  costPerDay: "100",
                                  items: self.system.items)

        self.system.createItem(self.system.members[0], car!)

        let itemID = self.system.items[1].id
        let member = self.system.members.last
        var exists = false
        do {
            let startDay = "1"
            let endDay = "4"
            let startDayInt = try Contract().checkStartDay(system.day, startDay)
            let endDayInt = try Contract().checkEndDay(startDayInt, endDay)
            let free = system.checkItemFree(itemID, startDayInt, endDayInt)
            let cost = system.calculateCost(itemID, abs(startDayInt-endDayInt))
            try system.checkMemberCredits(member!, cost)

            let contract = Contract(id: UUID().uuidString,
                                    lendee: member,
                                    startDay: startDayInt,
                                    endDay: endDayInt,
                                    cost: cost)

            self.system.createContract(itemID, contract)

            exists = ((self.system.items.first(where: {$0.id == itemID})?
                .contracts.contains(where: {$0.id == contract.id})) != nil)

            XCTAssertEqual(exists, true)
        } catch {
            XCTAssertEqual(exists, false)
        }
    }

    func test_CreateContract3() {
        let itemID = self.system.items[0].id
        let member = self.system.members.last
        var exists = false
        do {
            let startDay = "2"
            let endDay = "6"
            let startDayInt = try Contract().checkStartDay(system.day, startDay)
            let endDayInt = try Contract().checkEndDay(startDayInt, endDay)
            let free = system.checkItemFree(itemID, startDayInt, endDayInt)
            let cost = system.calculateCost(itemID, abs(startDayInt-endDayInt))
            try system.checkMemberCredits(member!, cost)
            if free {
                let contract = Contract(id: UUID().uuidString,
                                        lendee: member,
                                        startDay: startDayInt,
                                        endDay: endDayInt,
                                        cost: cost)

                self.system.createContract(itemID, contract)

                exists = ((self.system.items.first(where: {$0.id == itemID})?
                    .contracts.contains(where: {$0.id == contract.id})) != nil)

                XCTAssertEqual(exists, true)
            } else {
                XCTAssertEqual(exists, false)
            }
        } catch {
            XCTAssertEqual(exists, false)
        }
    }

    func test_AdvanceTime() {
        for _ in 0...8 {
            self.system.increaseDay()
        }

        let free = self.system.items[0].isAvalible

        XCTAssertEqual(free, true)
    }
}
