//
//  File.swift
//  
//
//  Created by Alex on 2022-09-20.
//

import Foundation
import SwiftyTextTable

enum ContractParseError: Error {
    case invalidStartDay
    case startDayNotANumber
    case invalidEndDay
    case endDayNotANumber
}

struct Contract: Identifiable {
    private(set) var id = UUID().uuidString
    private(set) var lendee: Member?
    private(set) var startDay: Int?
    private(set) var endDay: Int?
    private(set) var cost: Int?

    func checkStartDay(_ day: Int, _ startDay: String) throws -> Int {
        guard startDay.isNumber else {
            throw ContractParseError.startDayNotANumber
        }
        guard day <= Int(startDay)! else {
            throw ContractParseError.invalidStartDay
        }
        return Int(startDay) ?? 0
    }

    func checkEndDay(_ startDay: Int, _ endDay: String) throws -> Int {
        guard endDay.isNumber else {
            throw ContractParseError.endDayNotANumber
        }

        guard startDay < Int(endDay)! else {
            throw ContractParseError.invalidEndDay
        }
        return Int(endDay) ?? 0
    }
}

extension Contract: TextTableRepresentable {
    static var columnHeaders: [String] {
        ["Lendee ID", "Start Day", "End Day", "Cost"]
    }

    var tableValues: [CustomStringConvertible] {
        [lendee!.id, startDay!, endDay!, cost!]
    }

    static var tableHeader: String? {
        return "Contract History"
    }
}
