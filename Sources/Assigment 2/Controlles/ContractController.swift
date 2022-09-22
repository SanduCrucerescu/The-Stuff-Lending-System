//
//  File.swift
//  
//
//  Created by Alex on 2022-09-21.
//

import Foundation

func createContract(system: inout System) {
    do {
        ItemView().listItems(system.items)
        let index = ContractView().getItemID()
        let start = ContractView().getStartDay()
        let end = ContractView().getEndDay()

        let free = system.checkItemFree(index, start, end)

        if free {
            let lenteeEmail = ContractView().getRentee()
            let lenee = try system.getMember(lenteeEmail)
            let cost = system.calculateCost(index, abs(start-end))
            try system.checkMemberCredits(lenee, cost)

            let contract = Contract(borrower: lenee, startDay: start, endDate: end, cost: cost)
            system.createContract(index, contract)
        }
    } catch MemberParseError.notEnoughtCredits {
        print("not enought credits")
    } catch MemberParseError.userDoesntExist {
    } catch {
    }
}
