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

func doChangeItem(system: inout System, itemID: String, ownerEmail: String) {
    var choice = ItemView().changeItemInformation()

    switch choice {
    case .name:
        print("")
    case .description:
        print("")
    case .category:
        print("")
    case .costPerDay:
        print("")
    case .back:
        print("")
    }
}


//do {
//        let userExists = try system.checkMemberExists(ownerEmail)
//        let itemExists = try system.checkItemExists(ownerEmail, itemID)
//
//
//
//
//    } catch MemberParseError.userDoesntExist {
//
//    } catch ItemParseError.itemDosentExists {
//
//    } catch {
//
//    }


