//
//  File.swift
//  
//
//  Created by Alex on 2022-09-16.
//

import Foundation
import SwiftyTextTable

enum ItemParseError: Error {
    case itemDosentExists
}

struct Item: Identifiable, Equatable {

    enum Category {
        case tool
        case vehicle
        case game
        case toy
        case sport
        case other
    }

    private(set) var id = UUID().uuidString
    private(set) var name: String
    private(set) var description: String
    private(set) var creationDate: Date
    private(set) var category: Category
    private(set) var costPerDay: Int

    init(id: String = UUID().uuidString,
         name: String,
         description: String,
         creationDate: Date,
         category: Category,
         costPerDay: Int) {
        self.id = id
        self.name = name
        self.description = description
        self.creationDate = creationDate
        self.category = category
        self.costPerDay = costPerDay
    }

    var newName: String {
        get { return name }
        set { name = newValue}
    }

    var newDescription: String {
        get { return description }
        set { description = newValue }
    }

    var newCategory: Category {
        get { return category }
        set { category = newValue }
    }

    var newCostPerDay: Int {
        get { return costPerDay }
        set { costPerDay = newValue }
    }

}

extension Item: TextTableRepresentable {
    static var columnHeaders: [String] {
        ["ID", "Name", "Description", "Category", "Cost Per Day"]
    }

    var tableValues: [CustomStringConvertible] {
        <#code#>
    }

    
}
