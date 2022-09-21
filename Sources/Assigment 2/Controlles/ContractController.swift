//
//  File.swift
//  
//
//  Created by Alex on 2022-09-21.
//

import Foundation

func createContract(system: inout System) {
    ItemView().listItems(system.items)
    let index = ContractView().getItemID()
    let start = ContractView().getStartDay()
    let end = ContractView().getEndDay()

    let free = system.checkItemFree(index, start, end)

    if free {
        let lenteeEmail = ContractView().getRentee()
        let lenee = try? system.getMember(lenteeEmail)
//        let contract = ContractView().createContract()
        let contract = Contract(borrower: lenee!, startDay: start, endDate: end, cost: 12)
        system.createContract(index, contract)
    }
    print(free)
    
}
