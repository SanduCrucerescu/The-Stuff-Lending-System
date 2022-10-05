//
//  File.swift
//  
//
//  Created by Alex on 2022-09-17.
//

import Foundation

struct ItemView {

    enum Actions {
        case createItem
        case changeItem
        case listItem
        case deleteItem
        case createContract
        case back
    }

    enum ChangeItemActions {
        case name
        case description
        case category
        case costPerDay
        case back
    }

    func itemMenu() -> Actions {
        print("1 - Create Item for member")
        print("2 - Change item information")
        print("3 - List Item")
        print("4 - Delete Item")
        print("5 - Create new contract")
        print("q - back")
        print("\nPlease select a function: ", terminator: "") //

        let choice: String = readLine() ?? ""
        if choice == "q" || choice == "Q" {
            return Actions.back
        } else if choice == "1" {
            return Actions.createItem
        } else if choice == "2" {
            return Actions.changeItem
        } else if choice == "3" {
            return Actions.listItem
        } else if choice == "4" {
            return Actions.deleteItem
        } else if choice == "5" {
            return Actions.createContract
        } else {
            _ = itemMenu()
        }
        return Actions.back
    }

    func getCategory() -> Item.Category {
        for (index, category) in Item.Category.allCases.enumerated() {
            print("\(index + 1). \(category)")
        }
        print("Enter item category: ", terminator: "")
        let category = readLine() ?? ""
        if category == "1" {
            return Item.Category.tool
        } else if category == "2" {
            return Item.Category.vehicle
        } else if category == "3" {
            return Item.Category.game
        } else if category == "4" {
            return Item.Category.toy
        } else if category == "5" {
            return Item.Category.sport
        } else if category == "6" {
            return Item.Category.other
        }
        return Item.Category.other
    }

    // MARK: - Get item Data

    func createNewItem(creationDate: Int, category: Item.Category, owner: Member, items: [Item]) -> Item {
        print("Enter item name: ", terminator: "")
        let name = readLine() ?? ""
        print("Enter item desctiption: ", terminator: "")
        let description = readLine() ?? ""
        print("Enter cost per day: ", terminator: "")
        var costPerDay = readLine() ?? ""
        var status = true

        repeat {
            do {
                let item =  try Item(owner: owner,
                                     name: name,
                                     description: description,
                                     creationDate: creationDate,
                                     category: category,
                                     costPerDay: costPerDay,
                                     items: items)
                status = false
                return item
            } catch ItemParseError.costNotANumber {
                costPerDay = getNewCostPerDay()
            } catch {
                print("Other Error")
            }
        } while status
    }

    func getItemID() -> String {
        print("Enter item ID | q - exit: ", terminator: "")
        let itemID = readLine() ?? ""
        return itemID
    }

    func getNewName() -> String {
        print("Enter new item name: ", terminator: "")
        let name = readLine() ?? ""
        return name
    }

    func getNewDescription() -> String {
        print("Enter new item description: ", terminator: "")
        let description = readLine() ?? ""
        return description
    }

    func getNewCostPerDay() -> String {
        print("Enter new cost per day name: ", terminator: "")
        let costPerDay = readLine() ?? ""
        return costPerDay
    }

    func wrongCostPerDay() -> String {
        print("-- Please insert a numerical cost --")
        print("Enter new cost per day name | q- exit: ", terminator: "")
        let costPerDay = readLine() ?? ""
        return costPerDay
    }

    // MARK: - Items actions

    func itemIsLended() {
        print("Item has an actve contract! Try agin after.")
        print("Press any key to continue:", terminator: "")
        _ = readLine()

    }

    func listItem(_ item: [Item]) {
        let contracts = item[0].contracts
        print(item.renderTextTable())
        print(contracts.renderTextTable())
        print("Press any key to continue:", terminator: "")
        _ = readLine()
    }

    func listItems(_ items: [Item]) -> String {
        print(items.renderTextTable())
        print("Enter itemID | q -exit: ", terminator: "")
        let itemID = readLine() ?? ""
        return itemID
    }

    func changeItemInformation() -> ChangeItemActions {
        print("1. Name")
        print("2. Description")
        print("3. Category")
        print("4. Cost Per Day")
        print("Enter value you want to change | q - exit: ", terminator: "")
        let choise = readLine() ?? ""

        if choise == "1" {
            return ChangeItemActions.name
        } else if choise == "2" {
            return ChangeItemActions.description
        } else if choise == "3" {
            return ChangeItemActions.category
        } else if choise == "4" {
            return ChangeItemActions.costPerDay
        }

        return ChangeItemActions.back
    }
}
