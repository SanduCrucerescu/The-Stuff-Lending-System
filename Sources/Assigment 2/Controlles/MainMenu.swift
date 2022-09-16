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
        var run = true
        while(run) {
            let action: Console.Actions = console.mainMenu()
        
            switch action {
            case .addMember:
                system.addNewMember(MemberView().createNewMember())
                print(system.members)
                
            case .removeMemeber:
                let email = MemberView().deleteUser()
                system.removeMember(email)
                print(system.members)
                
            case .quit:
                run = false
            }
        }
    }
    
}
