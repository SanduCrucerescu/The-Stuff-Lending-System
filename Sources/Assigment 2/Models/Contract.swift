//
//  File.swift
//  
//
//  Created by Alex on 2022-09-20.
//

import Foundation

struct Contract: Identifiable {
    private(set) var id = UUID().uuidString
    private(set) var borrower: Member
    private(set) var startDay: Date
    private(set) var endDate: Date
    private(set) var cost: Int

    init(id: String = UUID().uuidString, borrower: Member, startDay: Date, endDate: Date, cost: Int) {
        self.id = id
        self.borrower = borrower
        self.startDay = startDay
        self.endDate = endDate
        self.cost = cost
    }
}
