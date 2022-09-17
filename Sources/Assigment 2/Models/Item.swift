//
//  File.swift
//  
//
//  Created by Alex on 2022-09-16.
//

import Foundation

struct Item: Identifiable, Equatable {

    enum Category {
        case Tool
        case Vehicle
        case Game
        case Toy
        case Sport
        case Other
    }

    private(set) var id = UUID().uuidString
    private(set) var name: String
    private(set) var description: String
    private(set) var creationDate: Date
    private(set) var category: Category
    private(set) var costPerDay: Int
}
