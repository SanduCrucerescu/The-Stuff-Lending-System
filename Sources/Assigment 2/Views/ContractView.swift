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

    func getStartDay() -> String {
        print("Enter start day to rent: ", terminator: "")
        let startDay = readLine() ?? ""
        return startDay
    }

    func getEndDay() -> String {
        print("Enter end day: ", terminator: "")
        let endDay = readLine() ?? ""
        return endDay
    }

    func getRentee() -> String {
        print("Enter rentee email | q - exit: ", terminator: "")
        let email = readLine() ?? ""
        return email
    }

    func invalidStardDay(_ error: String) -> String {
        print("Invalid start day \(error) | q - exit: ", terminator: "")
        let value = readLine() ?? ""
        return value
    }

    func invalidEndDay(_ error: String) -> String {
        print("Invalid end day \(error) | q - exit: ", terminator: "")
        let value = readLine() ?? ""
        return value
    }

    func notEnoughtCredits() {
        print("Lendee doesn't have enought credits, press any key to exit", terminator: "")
        _ = readLine()
    }
}
