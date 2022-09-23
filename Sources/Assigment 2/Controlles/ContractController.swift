//
//  File.swift
//  
//
//  Created by Alex on 2022-09-21.
//

import Foundation

func createContract(system: inout System) {
    let index = ItemView().listItems(system.items)
//    let index = ContractView().getItemID()
    let start = ContractView().getStartDay()
    let end = ContractView().getEndDay()
    var run = true
    var lenteeEmail = ""

    while run {
        do {
            guard index != "q" else {
                run = false
                return
            }

            let free = system.checkItemFree(index, start, end)
            run = false

            if free {
                lenteeEmail = ContractView().getRentee()
                
                guard lenteeEmail != "q" else {
                    run = false
                    return
                }

                let lenee = try system.getMember(lenteeEmail)
                let cost = system.calculateCost(index, abs(start-end))
                try system.checkMemberCredits(lenee, cost)

                let contract = Contract(borrower: lenee, startDay: start, endDate: end, cost: cost)
                system.createContract(index, contract)
            }
        } catch MemberParseError.notEnoughtCredits {
            ContractView().notEnoughtCredits()
            run = false
        } catch MemberParseError.userDoesntExist {
            run = true
        } catch {
        }
    }
}
