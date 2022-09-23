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

func doChangeItem(itemID: String, system: inout System) throws {
    var choice = ItemView().changeItemInformation()

    switch choice {
    case .name:
        let newItemName = ItemView().getNewName()
        system.changeItemName(itemID, newItemName)
    case .description:
        let newDescription = ItemView().getNewDescription()
        system.changeItemDescription(itemID, newDescription)
    case .category:
        let newCategory = ItemView().getCategory()
        system.chanageItemCategory(itemID, newCategory)
    case .costPerDay:
        changeCostPerDay(itemID, &system)
    case .back:
        choice = ItemView.Actions.back
    }
}

func checkItemTemplate(system: inout System, function: (String, inout System) throws -> Void, itemID: String?=nil) {
    var run = true
    var itemID = itemID ?? ItemView().getItemID()

    while run {
        do {
            guard itemID != "q" else {
                return run = false
            }
            _ = try system.checkItemExists(itemID)

            try function(itemID, &system)
            run = false
        } catch ItemParseError.itemDosentExists {
            itemID = ItemView().getItemID()
            run = true
        } catch {
        }
    }
}

func removeItem(_ itemID: String, _ system: inout System) throws {
    system.removeItem(itemID)
}

func changeCostPerDay(_ itemID: String, _ system: inout System) {
    var newCostPerDay = ItemView().getNewCostPerDay()
    var run = true

    while run {
        do {
            guard newCostPerDay != "q" else {
                return run = false
            }
            try system.changeItemCostPerDay(itemID, newCostPerDay)
            run = false
        } catch ItemParseError.costNotANumber {
            newCostPerDay = ItemView().wrongCostPerDay()
            run = true
        } catch {}
    }
}

func printItem(_ itemID: String, _ system: inout System) {
    let item = system.getItem(itemID)
    ItemView().listItem(item)
}
