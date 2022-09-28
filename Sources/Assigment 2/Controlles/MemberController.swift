//
//  File.swift
//  
//
//  Created by Alex on 2022-09-17.
//

import Foundation

struct MemberController {
    func memberMenuActions(system: inout System) {
        var run = true

        while run {
            let action: MemberView.Actions = MemberView().memberMenu()

            switch action {
            case .addMember:
                if let member = MemberView().createNewMember(system.members) {
                    system.addNewMember(member)
                }
            case .removeMemeber:
                checkEmailTemplate(system: &system,
                                   function: removeMember)
            case .listMembers:
                MemberView().listMembers(system.members)
            case .listMember:
                checkEmailTemplate(system: &system,
                                   function: listMember)
            case .verbose:
                MemberView().listVerbose(system.members,
                                         system.items,
                                         system.day)
            case .changeMember:
                checkEmailTemplate(system: &system,
                                   function: doChangeUser)
            case .back:
                run = false
            }
        }
    }

    func doChangeUser(system: inout System, _ email: String) throws {
        let userExists = try? system.checkMemberExists(email)

        guard userExists != false else {
            throw MemberParseError.userDoesntExist
        }

        var choice = MemberView().changeUserInformation()
        switch choice {
        case .name:
            let name = MemberView().reenterName()
            system.changeName(email, name)
        case .email:
            let email = MemberView().reenterEmail()
            system.changeEmail(email, email)
        case .phoneNumber:
            let phoneNumber = MemberView().reenterPhoneNumber()
            system.changePhoneNumber(email, phoneNumber)
        case .back:
            choice = MemberView.ChangeMemberActions.back
        }
    }

    func checkEmailTemplate(system: inout System, function: (inout System, String) throws -> Void) {
        var memberExists = true
        var value = MemberView().getMemberID()

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

    func removeMember(system: inout System, memberID: String) throws {
        do {
            _ = try system.checkMemberExists(memberID)
            system.removeMember(memberID)
        } catch {
            throw MemberParseError.userDoesntExist
        }
    }

    func listMember(system: inout System, email: String) throws {
        do {
            let member = try system.getMember(email)
            let memberTable = [member]
            MemberView().listMember(memberTable)
        } catch {
            throw MemberParseError.userDoesntExist
        }
    }
}
