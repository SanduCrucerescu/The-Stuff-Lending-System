//
//  File.swift
//  
//
//  Created by Alex on 2022-09-16.
//

import Foundation
import SwiftyTextTable

struct System {
    private(set) var day: Int = 0
    private(set) var members: [Member] = []
    private(set) var items: [Item] = []

    init(day: Int) {
        self.day = day
        self.members = []
        self.items = []
        let allan = try? Member(name: "Allan",
                              email: "allan@enigma.com",
                              mobilePhone: "123456",
                                members: self.members)
        members.append(allan!)
        let margaret = try? Member(name: "Margaret",
                              email: "margaret@enigma.com",
                              mobilePhone: "123457",
                              members: members)
        members.append(margaret!)

        let lego = try? Item(owner: allan!,
                             name: "Lego",
                             description: "It's fun to play with",
                             creationDate: day,
                             category: Item.Category.toy,
                             costPerDay: "50",
                             items: items)
        createItem(allan!, lego!)
    }

    mutating func increaseDay() {
        day += 1
        for (index, item) in items.enumerated() {
            for contract in item.contracts {
                if contract.endDay! < day || contract.startDay! > day {
                    items[index].newStatus = true
                } else {
                    items[index].newStatus = false
                }
            }
        }
    }

    // MARK: - Member functions

    mutating func addNewMember(_ member: Member) {
        members.append(member)
    }

    mutating func removeMember(_ memberID: String) {
        members.removeAll(where: {$0.id == memberID})
    }

    func getMember (_ memberID: String) throws -> Member {
        let member = members.first(where: {$0.id == memberID})

        guard member != nil else {
            throw MemberParseError.userDoesntExist
        }

        return member!
    }

    func checkMemberExists (_ memberID: String) throws -> Bool {
        guard members.contains(where: {$0.id == memberID}) else {
            throw MemberParseError.userDoesntExist
        }
        return true
    }

    mutating func changeName(_ email: String, _ newName: String) {
        if let index = members.firstIndex(where: {$0.email == email}) {
            members[index].newName = newName
        }
    }

    mutating func changeEmail(_ email: String, _ newEmail: String) {
        if let index = members.firstIndex(where: {$0.email == email}) {
            members[index].newEmail = newEmail
        }
    }

    mutating func changePhoneNumber(_ email: String, _ newPhoneNumber: String) {
        if let index = members.firstIndex(where: {$0.email == email}) {
            members[index].newPhoneNumber = newPhoneNumber
        }
    }

    func checkMemberCredits(_ member: Member, _ credits: Int) throws {
        guard !(member.newCredits < credits) else {
            throw MemberParseError.notEnoughtCredits
        }
    }

    // MARK: - Items functions

    mutating func createItem(_ owner: Member, _ item: Item) {
        if let index = members.firstIndex(where: {$0.id == owner.id}) {
            members[index] = owner
            members[index].newCredits += 100
            members[index].newOwnedItems += 1
        }
        items.append(item)
    }

    func getItem(_ itemID: String) -> [Item] {
        var itemPrint = [Item]()

        if let item = items.first(where: {$0.id == itemID}) {
            itemPrint.append(item)
            return itemPrint
        }

        return itemPrint
    }

    func checkItemExists(_ itemID: String) throws -> Bool {

        guard items.contains(where: {$0.id == itemID}) else {
            throw ItemParseError.itemDosentExists
        }

        return true
    }

    mutating func changeItemName(_ itemID: String, _ newName: String) {
        if let itemIndex = items.firstIndex(where: {$0.id == itemID}) {
            items[itemIndex].newName = newName
        }
    }

    mutating func changeItemDescription(_ itemID: String, _ newDescription: String) {
        if let itemIndex = items.firstIndex(where: {$0.id == itemID}) {
            items[itemIndex].newDescription = newDescription
        }
    }

    mutating func chanageItemCategory(_ itemID: String, _ newCategory: Item.Category) {
        if let itemIndex = items.firstIndex(where: {$0.id == itemID}) {
            items[itemIndex].newCategory = newCategory
        }
    }

    mutating func changeItemCostPerDay(_ itemID: String, _ newItemCostPerDay: String) throws {
        if let itemIndex = items.firstIndex(where: {$0.id == itemID}) {
            guard newItemCostPerDay.isNumber else {
                throw ItemParseError.costNotANumber
            }
            items[itemIndex].newCostPerDay = Int(newItemCostPerDay) ?? 0
        }

    }

    mutating func removeItem(_ itemID: String) {
        if let itemIndex = items.firstIndex(where: {$0.id == itemID}) {
            items.remove(at: itemIndex)
        }
    }

    func calculateCost(_ itemID: String, _ days: Int) -> Int {
        if let index = items.firstIndex(where: {$0.id == itemID}) {
            return items[index].costPerDay * days
        }
        return 0
    }

    // MARK: - Contract functions

    func checkItemFree(_ itemID: String, _ startDay: Int, _ endDay: Int) -> Bool {
        if let index = items.firstIndex(where: {$0.id == itemID}) {
            for contract in items[index].contracts {
                let contractRange = contract.startDay! ... contract.endDay!
                let newContractRange = startDay ... endDay
                return contractRange.overlaps(newContractRange) || contract.startDay == startDay ? false : true
            }
        }
        return true
    }

    mutating func createContract(_ itemID: String, _ contract: Contract) {
        if let index = items.firstIndex(where: {$0.id == itemID}) {
            items[index].addContract(contract)
        }
    }
}
