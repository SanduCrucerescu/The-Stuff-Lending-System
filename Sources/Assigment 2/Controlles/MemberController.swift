//
//  File.swift
//  
//
//  Created by Alex on 2022-09-17.
//

import Foundation

func doChangeUser(system: inout System, _ email: String) throws {
    let userExists = system.checkUser(email)

    guard userExists != false else {
        throw MemberParseError.userDoesntExist
    }
    var choice = MemberView().changeUserInformation()

    while choice != MemberView.Actions.back {
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
}
