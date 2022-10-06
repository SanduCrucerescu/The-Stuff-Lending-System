//
//  File.swift
//  
//
//  Created by Alex on 2022-09-19.
//

import Foundation

struct ItemController {
    func itemMenuActions(system: inout System) {
        var run = true

        while run {
            let action: ItemView.Actions = ItemView().itemMenu()

            switch action {

            case .createItem:
                MemberController().checkEmailTemplate(system: &system,
                                                      function: createItem)
            case .changeItem:
                checkItemTemplate(system: &system,
                                  function: doChangeItem)
            case .listItem:

                checkItemTemplate(system: &system,
                                  function: printItem)
            case .deleteItem:
                checkItemTemplate(system: &system,
                                  function: removeItem)
            case .createContract:
                ContractController().createContract(system: &system)
            case .back:
                run = false
            }

        }
    }

    func createItem(system: inout System, email: String) throws {
        do {
            let owner = try system.getMember(email)
            let category = ItemView().getCategory()
            let item = ItemView().createNewItem(creationDate: system.day,
                                                category: category,
                                                owner: owner,
                                                items: system.items)
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
            choice = ItemView.ChangeItemActions.back
        }
    }

    func checkItemTemplate(system: inout System, function: (String, inout System) throws -> Void, itemID: String?=nil) {
        var run = true
        var itemID = ItemView().listItems(system.items)

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
            } catch ItemParseError.itemHasAnActiveContract {
                ItemView().itemIsLended()
                run = false
            } catch {}
        }
    }

    func removeItem(_ itemID: String, _ system: inout System) throws {
        do {
            try system.removeItem(itemID)
        } catch {
            throw ItemParseError.itemHasAnActiveContract
        }
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
}
