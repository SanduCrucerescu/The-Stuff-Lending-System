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
            checkEmailTemplate(system: &system, function: remove)
        case .listMembers:
            MemberView().listMembers(system.members)
        case .listMember:
            listMember(system: &system)
        case .changeMember:
            checkEmailTemplate(system: &system, function: doChangeUser)
        case .createItem:
            createItem(system: &system)
        case .quit:
            run = false
        }
    }
}

func remove(system: inout System, email: String) throws {
    do {
        try system.checkMemberExists(email)
        system.removeMember(email)
    } catch {
        throw MemberParseError.userDoesntExist
    }
}


func checkEmailTemplate(system: inout System, function: (inout System, String) throws -> ()) {
    var memberExists = true
    var value = MemberView().getMemerEmail()


    repeat {
        do {
            guard value != "q" else {
                memberExists = false
                return
            }

            try function(&system, value)
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



func listMember(system: inout System) {
    let memberEmail = MemberView().getMemerEmail()
    let member = system.getMember(memberEmail)
    let memberTable = [member]
    MemberView().listMember(memberTable)
}

func createItem(system: inout System) {
    let email = MemberView().getMember()
    let category = ItemView().getCategory()
    let item = ItemView().createNewItem(creationDate: system.time,
                                        category: category)
    system.createItem(email, item)
}
