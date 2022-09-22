//
//  File.swift
//  
//
//  Created by Alex on 2022-09-20.
//

import Foundation
import SwiftyTextTable

struct Contract: Identifiable {
    private(set) var id = UUID().uuidString
    private(set) var borrower: Member
    private(set) var startDay: Int
    private(set) var endDate: Int
    private(set) var cost: Int

    init(id: String = UUID().uuidString, borrower: Member, startDay: Int, endDate: Int, cost: Int) {
        self.id = id
        self.borrower = borrower
        self.startDay = startDay
        self.endDate = endDate
        self.cost = cost
    }
}

extension Contract: TextTableRepresentable {
    static var columnHeaders: [String] {
        ["Borrower ID", "Start Day", "End Day", "Cost"]
    }

    var tableValues: [CustomStringConvertible] {
        [borrower.id, startDay, endDate, cost]
    }

    static var tableHeader: String? {
        return "Contract History"
    }
}
