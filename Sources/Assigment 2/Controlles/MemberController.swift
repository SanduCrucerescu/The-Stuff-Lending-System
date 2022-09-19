//
//  File.swift
//  
//
//  Created by Alex on 2022-09-17.
//

import Foundation

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
        choice = MemberView.Actions.back
    }
}

func checkEmailTemplate(system: inout System, function: (inout System, String) throws -> Void) {
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

func removeMember(system: inout System, email: String) throws {
    do {
        _ = try system.checkMemberExists(email)
        system.removeMember(email)
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
