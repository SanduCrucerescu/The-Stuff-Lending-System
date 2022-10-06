//
//  File.swift
//  
//
//  Created by Alex on 2022-09-21.
//

import Foundation

struct ContractController {
    func createContract(system: inout System) {
        let index = ItemView().listItems(system.items)
        var startDay = ContractView().getStartDay()
        var endDay = ContractView().getEndDay()
        var run = true
        //
        while run {
            do {
                run = exitLoop(index)
                let startDayInt = try Contract().checkStartDay(system.day, startDay)
                let endDayInt = try Contract().checkEndDay(startDayInt, endDay)
                let free = system.checkItemFree(index, startDayInt, endDayInt)
                run = false
                if free {
                    run = try createContract(&system, run, startDayInt, endDayInt, index)
                } else {
                    ItemView().itemIsLended()
                }
            } catch MemberParseError.notEnoughtCredits {
                ContractView().notEnoughtCredits()
                run = false
            } catch MemberParseError.userDoesntExist {
                run = true
            } catch ContractParseError.invalidEndDay {
                endDay = ContractView().invalidEndDay("inserted value can't be before start day")
                run = false
            } catch ContractParseError.invalidStartDay {
                startDay = ContractView().invalidStardDay("inserted value can't be in the past")
                run = false
            } catch ContractParseError.endDayNotANumber {
                endDay = ContractView().invalidEndDay("inserted value is not a number or is a float")
                run = false
            } catch ContractParseError.startDayNotANumber {
                startDay = ContractView().invalidStardDay("inserted value is not a number or is a float")
                run = false
            } catch {print("error")}
        }
    }
    //
    func exitLoop(_ string: String) -> Bool {
        guard string != "q" else {
            return false
        }
        return true
    }

    func createContract(_ system: inout System,
                        _ runLet: Bool,
                        _ startDayInt: Int,
                        _ endDayInt: Int,
                        _ index: String) throws -> Bool {
        var run = runLet
        do {
            let lenteeEmail = ContractView().getRentee()
            run = exitLoop(lenteeEmail)
            if run {
                let lendee = try system.getMember(lenteeEmail)
                let cost = system.calculateCost(index, abs(startDayInt-endDayInt))
                try system.checkMemberCredits(lendee, cost)
                //
                let contract = Contract(lendee: lendee,
                                        startDay: startDayInt,
                                        endDay: endDayInt,
                                        cost: cost)
                system.createContract(index, contract)
                ContractView().contractCreated()
                run = false
            } else {
                return run
            }
        } catch MemberParseError.userDoesntExist {
            throw MemberParseError.userDoesntExist
        } catch MemberParseError.notEnoughtCredits {
            throw MemberParseError.notEnoughtCredits
        } catch {}
        return run
    }
}
