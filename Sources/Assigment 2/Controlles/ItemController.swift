//
//  File.swift
//  
//
//  Created by Alex on 2022-09-19.
//

import Foundation

func createItem(system: inout System, email: String) throws {
    do {
        var owner = try system.getMember(email)
        let category = ItemView().getCategory()
        owner.newOwnedItems += 1
        let item = ItemView().createNewItem(creationDate: system.day,
                                            category: category,
                                            owner: owner)
        system.createItem(owner, item)
    } catch {
        throw MemberParseError.userDoesntExist
    }
}

func doChangeItem(ownerEmail: String, itemID: String, system: inout System) throws {
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
        try? system.changeItemCostPerDay(ownerEmail, itemID, newCostPerDay) // TODO: - fix this catch
    case .back:
        choice = ItemView.Actions.back
    }
}

func checkItemTemplate(system: inout System, function: (String, String, inout System) throws -> Void) {
    var run = true
    var ownerEmail = MemberView().getMemerEmail()
    var itemID = ItemView().getItemID()

    while run {
        do {
            _ = try system.checkMemberExists(ownerEmail)
            _ = try system.checkItemExists(ownerEmail, itemID)

            try function(ownerEmail, itemID, &system)
            run = false
        } catch MemberParseError.userDoesntExist {
            ownerEmail = MemberView().memberDosentExist()
            guard ownerEmail != "q" || ownerEmail != "Q" else {
                run = false
                return
            }
            run = true
        } catch ItemParseError.itemDosentExists {
            itemID = ItemView().getItemID()
            guard itemID != "q" || itemID != "Q" else {
                run = false
                return
            }
            run = true
        } catch {
        }
    }
}

func removeItem(_ ownerEmail: String, _ itemID: String, _ system: inout System) throws {
    system.removeItem(ownerEmail, itemID)
}
