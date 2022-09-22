//
//  File.swift
//  
//
//  Created by Alex on 2022-09-16.
//

import Foundation
import SwiftyTextTable

enum MemberParseError: Error {
    case usedEmail
    case usedPhoneNumber
    case notAPhoneNuber
    case userDoesntExist
    case notEnoughtCredits
}

struct Member: Identifiable {
    private(set) var id = UUID().uuidString.prefix(6)
    private(set) var name: String
    private(set) var email: String
    private(set) var phoneNumber: String
    private(set) var ownedItems: Int
    private(set) var credits: Int

    init(name: String,
         email: String,
         mobilePhone: String,
         members: [Member]) throws {
        self.name = name
        self.email = try Self.checkEmail(email, members)
        self.phoneNumber = try Self.checkPhoneNumber(mobilePhone, members)
        self.ownedItems = 0
        self.credits = 0
    }

    var newName: String {
        get { return name }
        set { name = newValue }
    }

    var newEmail: String {
        get { return email }
        set { email = newValue }
    }

    var newPhoneNumber: String {
        get { return phoneNumber }
        set { phoneNumber = newValue }
    }

    var newCredits: Int {
        get { return credits }
        set { credits = newValue }
    }

    var newOwnedItems: Int {
        get { return ownedItems }
        set { ownedItems = newValue }
    }

}

extension Member {
    private static func checkEmail (_ email: String, _ members: [Member]) throws -> String {
        guard !members.contains(where: {$0.email == email}) else {
            throw MemberParseError.usedEmail
        }
        return email
    }

    private static func checkPhoneNumber (_ phoneNumber: String, _ members: [Member]) throws -> String {
        guard !members.contains(where: {$0.phoneNumber == phoneNumber}) else {
            throw MemberParseError.usedPhoneNumber
        }
        guard phoneNumber.isNumber else {
            throw MemberParseError.notAPhoneNuber
        }
        return phoneNumber
    }
}

extension Member: TextTableRepresentable {
    static var columnHeaders: [String] {
        ["Name", "Email", "Phone Number", "Credits", "Owned Items"]
    }

    var tableValues: [CustomStringConvertible] {
        [name, email, phoneNumber, credits, ownedItems]
    }
}
