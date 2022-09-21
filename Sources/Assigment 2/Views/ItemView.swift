//
//  File.swift
//  
//
//  Created by Alex on 2022-09-17.
//

import Foundation

struct ItemView {

    enum Actions {
        case name
        case description
        case category
        case costPerDay
        case back
    }

    func getCategory() -> Item.Category {
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

    func createNewItem(creationDate: Int, category: Item.Category, owner: Member) -> Item {
        print("Enter item name: ", terminator: "")
        let name = readLine() ?? ""
        print("Enter item desctiption: ", terminator: "")
        let description = readLine() ?? ""
        print("Enter cost per day: ", terminator: "")
        let costPerDay = readLine() ?? ""

        return Item(owner: owner,
                    name: name,
                    description: description,
                    creationDate: creationDate,
                    category: category,
                    costPerDay: Int(costPerDay)!)
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

    func getNewCostPerDay() -> Int {
        print("Enter new cost per day name: ", terminator: "")
        let costPerDay = readLine() ?? ""
        return Int(costPerDay) ?? 0
    }

    // MARK: - Items actions

    func listITem(_ item: [Item]) {
        print(item.renderTextTable())
        _ = readLine()
    }

    func changeItemInformation() -> Actions {
        print("1. Name")
        print("2. Description")
        print("3. Category")
        print("4. Cost Per Day")
        print("Enter value you want to change | q - exit: ", terminator: "")
        let choise = readLine() ?? ""

        if choise == "1" {
            return Actions.name
        } else if choise == "2" {
            return Actions.description
        } else if choise == "3" {
            return Actions.category
        } else if choise == "4" {
            return Actions.costPerDay
        }

        return Actions.back
    }
}
