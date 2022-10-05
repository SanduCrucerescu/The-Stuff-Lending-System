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
    case costNotANumber
    case itemHasAnActiveContract
}

struct Item: Identifiable, Equatable {
    static func == (lhs: Item, rhs: Item) -> Bool {
        let val = lhs.name == rhs.name
        return val
    }

    enum Category: CaseIterable {
        case tool
        case vehicle
        case game
        case toy
        case sport
        case other
    }

    private(set) var id: String
    private(set) var owner: Member
    private(set) var name: String
    private(set) var description: String
    private(set) var creationDate: Int
    private(set) var category: Category
    private(set) var costPerDay: Int
    private(set) var isAvalible: Bool = true
    private(set) var contracts: [Contract]

    init(owner: Member,
         name: String,
         description: String,
         creationDate: Int,
         category: Category,
         costPerDay: String,
         items: [Item]) throws {
        self.id = Self.checkID(String(UUID().uuidString.prefix(8)), items)
        self.owner = owner
        self.name = name
        self.description = description
        self.creationDate = creationDate
        self.category = category
        self.costPerDay = try Self.checkCost(costPerDay)
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
        set { costPerDay = newValue}
    }

    var newStatus: Bool {
        get { return isAvalible }
        set { isAvalible = newValue }
    }

    mutating func addContract(_ contract: Contract) {
        contracts.append(contract)
    }
}

extension Item: TextTableRepresentable {
    static var columnHeaders: [String] {
        ["ID", "Name", "Description", "Category", "Cost Per Day", "Is Avalible"]
    }

    var tableValues: [CustomStringConvertible] {
        return [id, name, description, String(describing: category), costPerDay, isAvalible]
    }

    static var tableHeader: String? {
        return "Items in store"
    }

    private static func checkCost (_ costPerDay: String) throws -> Int {
        guard costPerDay.isNumber else {
            throw ItemParseError.costNotANumber
        }
        return Int(costPerDay) ?? 0
    }

    private static func checkID(_ id: String, _ items: [Item]) -> String {
        var newID: String = id
        while true {
            guard !items.contains(where: {$0.id == id}) else {
                newID = String(UUID().uuidString.prefix(6))
                return newID
            }
            break
        }
        return newID
    }
}
