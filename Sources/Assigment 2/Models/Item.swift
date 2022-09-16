//
//  File.swift
//  
//
//  Created by Alex on 2022-09-16.
//

import Foundation

struct Item: Identifiable {
    private(set) var id = UUID().uuidString
    private(set) var name: String
    private(set) var description: String
    private(set) var creationDate: Date
    private(set) var costPerDay: Int
}
