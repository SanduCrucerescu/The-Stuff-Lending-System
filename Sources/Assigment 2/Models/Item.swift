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
    static func == (lhs: Item, rhs: Item) -> Bool {
        let val = lhs.name == rhs.name
        return val
    }

    enum Category {
        case tool
        case vehicle
        case game
        case toy
        case sport
        case other
    }

    private(set) var id = UUID().uuidString.prefix(8)
    private(set) var owner: Member
    private(set) var name: String
    private(set) var description: String
    private(set) var creationDate: Int
    private(set) var category: Category
    private(set) var costPerDay: Int
    private(set) var contracts: [Contract]

    init(owner: Member,
         name: String,
         description: String,
         creationDate: Int,
         category: Category,
         costPerDay: Int) {
        self.owner = owner
        self.name = name
        self.description = description
        self.creationDate = creationDate
        self.category = category
        self.costPerDay = costPerDay
        self.contracts = []
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

    mutating func addContract(_ contract: Contract) {
        contracts.append(contract)
    }
}

extension Item: TextTableRepresentable {
    static var columnHeaders: [String] {
        ["ID","Name", "Description", "Category", "Cost Per Day", "Contract"]
    }

    var tableValues: [CustomStringConvertible] {
        [id, name, description, String(describing: category), costPerDay, contracts]
    }

    static var tableHeader: String? {
        return "Items in store"
    }
}
