//
//  File.swift
//  
//
//  Created by Alex on 2022-09-16.
//

import Foundation

struct MainMenuView {
    enum Actions {
        case member
        case item
        case advanceDay
        case quit
    }

    func mainMenu() -> Actions {
        print("\n    The Stuff Lending System")
        print("1 - Member Actions")
        print("2 - Item Actions")
        print("3 - Advance Day")
        print("q - Quit")
        print("\nPlease select a function: ", terminator: "") //

        let choice: String = readLine() ?? ""
        print("\u{001B}[2J")

        if choice == "q" || choice == "Q" {
            return Actions.quit
        } else if choice == "1" {
            return Actions.member
        } else if choice == "2" {
            return Actions.item
        } else if choice == "3" {
            return Actions.advanceDay
        } else {
            _ = mainMenu()
        }
        return Actions.quit
    }
}
