//
//  File.swift
//  
//
//  Created by Alex on 2022-09-16.
//

import Foundation
import SwiftyTextTable

struct System {
    private(set) var time: Date
    private(set) var members: [Member] = []
    private(set) var items: [Item] = []

    // MARK: - Member functions

    mutating func addNewMember(_ member: Member) {
        members.append(member)
    }

    mutating func removeMember(_ email: String) {
        members.removeAll { member in
            member.email == email
        }
    }

    func getMember (_ email: String) throws -> Member {
        let member = members.first(where: {$0.email == email})

        guard member != nil else {
            throw MemberParseError.userDoesntExist
        }

        return member!
    }

    func checkMemberExists (_ email: String) throws -> Bool {
        guard members.contains(where: {$0.email == email}) else {
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

    // MARK: - Items functions

    mutating func createItem(_ owner: Member, _ item: Item) {
        if let index = members.firstIndex(where: {$0.id == owner.id}) {
            members[index] = owner
            members[index].newCredits += 100
        }
        items.append(item)
    }

    func getItem(_ itemID: String) -> [Item] {
        var item = [Item]()

        if let itemIndex = items.first(where: {$0.id == itemID}) {
            item.append(itemIndex)
            return item
        }

        return item
    }

    func checkItemExists(_ ownerEmail: String, _ itemID: String) throws -> Bool {

        guard items.contains(where: {$0.id == itemID}) else {
            throw ItemParseError.itemDosentExists
        }

        return true
    }

    mutating func changeItemName(_ ownerEmail: String, _ itemID: String, _ newName: String) {
        if let itemIndex = items.firstIndex(where: {$0.id == itemID}) {
            items[itemIndex].newName = newName
        }
    }

    mutating func changeItemDescription(_ ownerEmail: String, _ itemID: String, _ newDescription: String) {
        if let itemIndex = items.firstIndex(where: {$0.id == itemID}) {
            items[itemIndex].newDescription = newDescription
        }
    }

    mutating func chanageItemCategory(_ ownerEmail: String, _ itemID: String, _ newCategory: Item.Category) {
        if let itemIndex = items.firstIndex(where: {$0.id == itemID}) {
            items[itemIndex].newCategory = newCategory
        }
    }

    mutating func changeItemCostPerDay(_ ownerEmail: String, _ itemID: String, _ newItemCostPerDay: Int) {
        if let itemIndex = items.firstIndex(where: {$0.id == itemID}) {
            items[itemIndex].newCostPerDay = newItemCostPerDay
        }
    }

    mutating func removeItem(_ ownerEmail: String, _ itemID: String) {
        if let itemIndex = items.firstIndex(where: {$0.id == itemID}) {
            items.remove(at: itemIndex)
        }
    }
}
