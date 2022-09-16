//
//  File.swift
//  
//
//  Created by Alex on 2022-09-16.
//

import Foundation

struct Console {
    
    enum Actions {
        case addMember
        case quit
    }
    
    func createNewMember() -> Member {
        print("Enter data: ")
        return Member(name: "a", email: "a", mobilePhone: 1, ownedItems: [Item]())
    }
    
    func mainMenu() -> Actions {
        print("The Stuff Lending System")
        print("add - Add new member")
        print("remove - Remove member")
        print("q - Quit")
        print("Please select a function: ", terminator: "")
        
        let choice:String = readLine() ?? ""
        
        if choice == "q" || choice == "Q" {
            return Actions.quit
        } else if choice == "add" {
            return Actions.addMember
        }
        return Actions.quit
    }
}
