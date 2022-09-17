//
//  File.swift
//  
//
//  Created by Alex on 2022-09-16.
//

import Foundation

enum MemberParseError: Error {
    case usedEmail
    case usedPhoneNumber
}

struct Member: Identifiable {
    private(set) var id = UUID().uuidString.prefix(6)
    private(set) var name: String
    private(set) var email: String
    private(set) var mobilePhone: String
    private(set) var ownedItems: Array<Item?>
    private(set) var credits: Int
   
    init(name: String, email: String, mobilePhone: String, ownedItems: Array<Item?>, credits: Int, members: Array<Member>) throws {
        self.name = name
        self.email = try Self.checkEmail(email, members)
        self.mobilePhone = try Self.checkPhoneNumber(mobilePhone, members)
        self.ownedItems = ownedItems
        self.credits = credits
    }
    
    mutating func addItem(_ item: Item) {
        ownedItems.append(item)
    }
    
    var newName: String {
        get { return name}
        set { name = newValue }
    }
    
}

extension Member {
    private static func checkEmail(_ email: String, _ members: Array<Member>) throws -> String  {

        guard !members.contains(where: {$0.email == email}) else {
            throw MemberParseError.usedEmail
        }
        
        return email
    }
    
    private static func checkPhoneNumber(_ phoneNumber: String, _ members: Array<Member>) throws -> String  {

        guard !members.contains(where: {$0.mobilePhone == phoneNumber}) else {
            throw MemberParseError.usedPhoneNumber
        }
        
        return phoneNumber
    }
}
