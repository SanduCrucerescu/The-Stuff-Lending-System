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
        case removeMemeber
        case listMembers
        case changeUser
        case createItem
        case quit
    }
    
    func mainMenu() -> Actions {
        print("\n    The Stuff Lending System")
        print("add - Add new member")
        print("remove - Remove member")
        print("change - Change a member's information ")
        print("list - List Members")
        print("create - Create Item for member")
        print("q - Quit")
        print("\nPlease select a function: ", terminator: "")
        
        let choice: String = readLine() ?? ""
        print("\u{001B}[2J")
        
        if choice == "q" || choice == "Q" {
            return Actions.quit
        } else if choice == "add" {
            return Actions.addMember
        } else if choice == "remove" {
            return Actions.removeMemeber
        } else if choice == "list" {
            return Actions.listMembers
        } else if choice == "change" {
            return Actions.changeUser
        }else if choice == "create" {
            return Actions.createItem
        }
        
        return Actions.quit
    }
}
