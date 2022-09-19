//
//  File.swift
//  
//
//  Created by Alex on 2022-09-16.
//

import Foundation

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
}
