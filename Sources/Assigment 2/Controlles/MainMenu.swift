//
//  File.swift
//  
//
//  Created by Alex on 2022-09-16.
//

import Foundation

struct MainMenu {
    var console: Console
    var system: System
    
    mutating func mainMenuActions() {
        let action: Console.Actions = console.mainMenu()
        switch action {
            case .addMember:
                print("here")
                system.addNewMember(console.createNewMember())
            case .quit:
                print("a")
            }
    }
    
}
