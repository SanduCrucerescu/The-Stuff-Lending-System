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
            let email = MemberView().deleteUser()
            system.removeMember(email)
        case .listMembers:
            MemberView().printMembers(system.members)
        case .changeUser:
            changeUser(system: &system)
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

func changeUser(system: inout System) {
    var memberExists = true
    var value = ""

    repeat {
        do {
            value = MemberView().getMemerEmail()
            try doChangeUser(system: &system, value)
            memberExists = false
        } catch MemberParseError.userDoesntExist {
            value = MemberView().memberDosentExist()
            if value == "q"{
                memberExists = false
            } else {
                memberExists = true
            }
        } catch {
        }
    } while memberExists
}
