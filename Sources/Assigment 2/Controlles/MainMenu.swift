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
                if let member = MemberView().createNewMember() {
                    system.addNewMember(member)
                }
            case .removeMemeber:
                let email = MemberView().deleteUser()
                system.removeMember(email)
            case .listMembers:
                let member = system.listMembers()
                MemberView().printMembers(member)
            case .createItem:
                let email = MemberView().getMember()
                let category = ItemView().getCategory()
                let item = ItemView().createNewItem(creationDate: system.time,
                                                    category: category)
                
                system.createItem(email, item)
            case .quit:
                run = false
            }
        }
    }
    
}
