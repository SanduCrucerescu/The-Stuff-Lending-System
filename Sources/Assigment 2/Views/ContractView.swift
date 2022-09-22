//
//  File.swift
//  
//
//  Created by Alex on 2022-09-21.
//

import Foundation

struct ContractView {

    func getItemID() -> String {
        print("Enter item ID you want to rent: ", terminator: "")
        let itemIndex = readLine() ?? ""
        return itemIndex
    }

    func getStartDay() -> Int {
        print("Enter start day to rent: ", terminator: "")
        let startDay = readLine() ?? ""
        return Int(startDay) ?? 0
    }

    func getEndDay() -> Int {
        print("Enter end day: ", terminator: "")
        let endDay = readLine() ?? ""
        return Int(endDay) ?? 0
    }

    func getRentee() -> String {
        print("Enter rentee email | q - exit: ", terminator: "")
        let email = readLine() ?? ""
        return email
    }

    func notEnoughtCredits() {
        print("Lendee doesn't have enought credits, press any key to exit", terminator: "")
        _ = readLine()
    }
}
