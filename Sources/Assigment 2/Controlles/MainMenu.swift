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
            removeMember(system: &system)
        case .listMembers:
            MemberView().listMembers(system.members)
        case .listMember:
            listMember(system: &system)
        case .changeMember:
            changeUser(system: &system)
        case .createItem:
            createItem(system: &system)
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

            guard value != "q" else {
                memberExists = false
                return
            }

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

//func removeMember(system: inout System) {
//    var memberExists = true
//    var value = ""
//
//    while memberExists {
//        do {
//            value = MemberView().deleteUser()
//
//            guard value != "q" else {
//                memberExists = false
//                return
//            }
//
//            try system.checkMemberExists(value)
//            system.removeMember(value)
//            memberExists = false
//        } catch MemberParseError.userDoesntExist {
//            value = MemberView().deleteUser()
//            if value == "q"{
//                memberExists = false
//            } else {
//                memberExists = true
//            }
//        } catch {
//        }
//    }
//}

func teamplate(system: inout System, mainFunc: (System, String?), secFunc: (String)?) {
    var memberExists = true
    var value = ""

    while memberExists {
        do {
            value = MemberView().deleteUser()

            guard value != "q" else {
                memberExists = false
                return
            }

            try system.checkMemberExists(value)
            system.removeMember(value)
            memberExists = false
        } catch MemberParseError.userDoesntExist {
            value = MemberView().deleteUser()
            if value == "q"{
                memberExists = false
            } else {
                memberExists = true
            }
        } catch {
        }
    }
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
