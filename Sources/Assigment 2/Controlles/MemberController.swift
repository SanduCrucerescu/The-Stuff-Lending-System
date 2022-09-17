//
//  File.swift
//  
//
//  Created by Alex on 2022-09-17.
//

import Foundation

func doChangeUser(system: inout System) {
    let email = MemberView().getMemerEmail()
    let choice = MemberView().changeUserInformation()

    switch choice {
    case .name:
        let name = MemberView().reenterName()
        system.changeName(email, name)
    case .email:
        let name = MemberView().reenterName()
        system.changeName(email, name)
    case .phoneNumber:
        let name = MemberView().reenterName()
        system.changeName(email, name)
    case .back:
        let name = MemberView().reenterName()
        system.changeName(email, name)
    }
}
