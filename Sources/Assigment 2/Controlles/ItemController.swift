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

func doChangeItem(system: inout System, itemID: String, ownerEmail: String) throws {
    var choice = ItemView().changeItemInformation()

    switch choice {
    case .name:
        let newItemName = ItemView().getNewName()
        system.changeItemName(ownerEmail, itemID, newItemName)
    case .description:
        let newDescription = ItemView().getNewDescription()
        system.changeItemDescription(ownerEmail, itemID, newDescription)
    case .category:
        let newCategory = ItemView().getCategory()
        system.chanageItemCategory(ownerEmail, itemID, newCategory)
    case .costPerDay:
        let newCostPerDay = ItemView().getNewCostPerDay()
        system.changeItemCostPerDay(ownerEmail, itemID, newCostPerDay)
    case .back:
        choice = ItemView.Actions.back
    }
}

func checkItemTemplate(system: inout System, function: (inout System, String, String) throws -> Void) {
    var run = true
    var ownerEmail = ""
    var itemID = ""

    repeat {
        do {
            ownerEmail = MemberView().getMemerEmail()
            _ = try system.checkMemberExists(ownerEmail)
            itemID = ItemView().getItemID()
            _ = try system.checkItemExists(ownerEmail, itemID)

            try function(&system, ownerEmail, itemID)
            run = false
        } catch MemberParseError.userDoesntExist {
            ownerEmail = MemberView().getMemerEmail()
            guard ownerEmail != "q" || ownerEmail != "Q" else {
                run = false
                return
            }
            run = true
        } catch ItemParseError.itemDosentExists {
            itemID = MemberView().getMemerEmail()
            guard itemID != "q" || itemID != "Q" else {
                run = false
                return
            }
            run = true
        } catch {
        }
    } while run
}

func listItem() {
    
}
