//
//  File.swift
//  
//
//  Created by Alex on 2022-09-16.
//

import Foundation

struct MemberView {
    
    func createNewMember() -> Member {
        print("Enter name: ", terminator: "")
        let name = readLine() ?? ""
        print("Enter email: ", terminator: "")
        let email = readLine() ?? ""
        print("Enter mobile phone number: ", terminator: "")
        let phoneNumber = readLine() ?? ""
        
        return Member(name: name, email: email, mobilePhone: phoneNumber, ownedItems: [Item]())
    }
    
    func deleteUser() -> String {
        print("Insert email of the user to delete: ", terminator: "")
        let email = readLine() ?? ""
        
        return email
    }
    
}
