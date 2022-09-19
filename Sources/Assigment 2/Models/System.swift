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
            members[index].addItem(item)
            members[index].newCredits = members[index].newCredits + 100
        }
    }

    func checkItemExists(_ owner: Member, _ itemID: String) {
//        if let memberIndex = members.
    }
}
