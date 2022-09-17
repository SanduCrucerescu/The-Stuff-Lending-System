//
//  File.swift
//  
//
//  Created by Alex on 2022-09-17.
//

import Foundation

struct ItemView {
    
    func getCategory() -> Item.Category {
        print("Enter item category: ", terminator: "")
        let category = readLine() ?? ""
        
        if category == "1" {
            return Item.Category.Tool
        } else if category == "2" {
            return Item.Category.Vehicle
        } else if category == "3" {
            return Item.Category.Game
        } else if category == "4" {
            return Item.Category.Toy
        } else if category == "5" {
            return Item.Category.Sport
        } else if category == "6" {
            return Item.Category.Other
        }
        return Item.Category.Other
    }
    
    
    func createNewItem(creationDate: Date, category: Item.Category) -> Item {
        print("Enter item name: ", terminator: "")
        let name = readLine() ?? ""
        print("Enter item desctiption: ", terminator: "")
        let description = readLine() ?? ""
        print("Enter cost per day: ", terminator: "")
        let costPerDay = readLine() ?? ""
        
        return Item(name: name,
                    description: description,
                    creationDate: creationDate,
                    category: category,
                    costPerDay: Int(costPerDay)!)

    }
    
    
    
}
