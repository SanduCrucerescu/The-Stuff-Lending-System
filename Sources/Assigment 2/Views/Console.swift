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
        case listMember
        case changeMember
        case createItem
        case changeItem
        case listItem
        case deleteItem
        case createContract
        case advanceDay
        case quit
    }

    func mainMenu() -> Actions {
        print("\n    The Stuff Lending System")
        print("1 - Add new member")
        print("2 - Remove member")
        print("3 - Change a member's information")
        print("4 - Look at a specific members full information")
        print("5 - List Members")
        print("6 - Create Item for member")
        print("7 - Change item information")
        print("8 - List Item")
        print("9 - Delete Item")
        print("10 - Create new contract")
        print("11 - Advance Day")
        print("q - Quit")
        print("\nPlease select a function: ", terminator: "") //

        let choice: String = readLine() ?? ""
        print("\u{001B}[2J") //

        if choice == "q" || choice == "Q" {
            return Actions.quit
        } else if choice == "1" {
            return Actions.addMember
        } else if choice == "2" {
            return Actions.removeMemeber
        } else if choice == "3" {
            return Actions.changeMember
        } else if choice == "4" {
            return Actions.listMember
        } else if choice == "5" {
            return Actions.listMembers
        } else if choice == "6" {
            return Actions.createItem
        } else if choice == "7" {
            return Actions.changeItem
        } else if choice == "8" {
            return Actions.listItem
        } else if choice == "9" {
            return Actions.deleteItem
        } else if choice == "10" {
            return Actions.createContract
        } else if choice == "11" {
            return Actions.advanceDay
        }

        return Actions.quit
    }
}
