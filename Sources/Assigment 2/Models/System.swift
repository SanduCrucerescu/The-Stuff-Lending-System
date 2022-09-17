//
//  File.swift
//  
//
//  Created by Alex on 2022-09-16.
//

import Foundation

struct System {
    private(set) var time: Date
    private(set) var members: [Member] = []
    
    mutating func addNewMember(_ member: Member) {
        members.append(member)
    }
    
    mutating func removeMember(_ email: String) {
        members.removeAll { member in
            member.email == email
        }
    }
    
    func listMembers() -> String {
        for member in members {
            return "Name: \(member.name) Email: \(member.email) Mobile Phone Number: \(member.mobilePhone) \nOwned Items: \(member.ownedItems)"
        }
        return "\n -- No Users Found --"
    }
    
    mutating func createItem(_ email: String, _ item: Item) {
        let owner = getMember(email)
        
        
        
        if let index = members.firstIndex(where: {$0.id == owner.id}) {
            members[index].addItem(item)
        }
    }
    
    func getMember (_ email: String) -> Member {
        members.first(where: {$0.email == email})!
    }
    
    
    
}
