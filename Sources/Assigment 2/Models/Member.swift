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
   
    init(name: String, email: String, mobilePhone: String, ownedItems: Array<Item?>, credits: Int) throws {
        self.name = name
        self.email = try Self.checkEmail(email)
        self.mobilePhone = mobilePhone
        self.ownedItems = ownedItems
        self.credits = credits
    }
    
    func checkPhoneNumber() {
        
    }
    
    mutating func addItem(_ item: Item) {
        ownedItems.append(item)
    }
    
}

extension Member {
    private static func checkEmail(_ email: String) throws -> String  {
        let temail = "test"
        
        guard email != temail else {
            throw MemberParseError.usedEmail
        }
        
        return email
    }
    
    private static func checkPhoneNumber(_ phoneNumber: String) throws -> String  {
        let temail = "test"
        
        guard phoneNumber != temail else {
            throw MemberParseError.usedPhoneNumber
        }
        
        return phoneNumber
    }
}
