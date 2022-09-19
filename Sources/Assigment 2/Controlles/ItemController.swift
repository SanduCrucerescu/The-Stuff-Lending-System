//
//  File.swift
//  
//
//  Created by Alex on 2022-09-19.
//

import Foundation

func createItem(system: inout System, email: String) throws {
    do {
        let owner = try system.getMember(email)
        let category = ItemView().getCategory()
        let item = ItemView().createNewItem(creationDate: system.time,
                                            category: category)
        system.createItem(owner, item)
    } catch {
        throw MemberParseError.userDoesntExist
    }
}
