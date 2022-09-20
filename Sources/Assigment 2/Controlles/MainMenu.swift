//
//  File.swift
//  
//
//  Created by Alex on 2022-09-16.
//

import Foundation

func mainMenuActions(console: Console, system: inout System) {
    var run = true

    while run {
        let action: Console.Actions = console.mainMenu()

        switch action {
        case .addMember:
            if let member = MemberView().createNewMember(system.members) {
                system.addNewMember(member)
            }
        case .removeMemeber:
            checkEmailTemplate(system: &system, function: removeMember)
        case .listMembers:
            MemberView().listMembers(system.members)
        case .listMember:
            checkEmailTemplate(system: &system, function: listMember)
        case .changeMember:
            checkEmailTemplate(system: &system, function: doChangeUser)
        case .createItem:
            checkEmailTemplate(system: &system, function: createItem)
        case .changeItem:
            checkItemTemplate(system: &system, function: doChangeItem)
        case .listItem:
            let itemID = ItemView().getItemID()
            ItemView().listITem(system.getItem(itemID))
        case .deleteItem:
            checkItemTemplate(system: &system, function: removeItem)
        case .quit:
            run = false
        }
    }
}
