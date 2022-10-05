//
//  File.swift
//  
//
//  Created by Alex on 2022-10-05.
//

import Foundation

protocol SaveData {
    func loadDataFromCSV()
    func saveDataToCSV()
}

protocol MemberFunctions {
    mutating func addNewMember(_ member: Member)
    mutating func removeMember(_ memberID: String)
    func getMember(_ memberID: String) throws -> Member
    func checkMemberExists(_ memberID: String) throws -> Bool
    mutating func changeName(_ memberID: String, _ newName: String)
    mutating func changeEmail(_ memberID: String, _ newEmail: String)
    mutating func changePhoneNumber(_ memberID: String, _ newPhoneNumber: String)
    func checkMemberCredits(_ member: Member, _ credits: Int) throws
}

protocol ItemFunctions {
    mutating func createItem(_ owner: Member, _ item: Item)
    func getItem(_ itemID: String) -> [Item]
    func checkItemExists(_ itemID: String) throws -> Bool
    func checkItemFree(_ itemID: String, _ startDay: Int, _ endDay: Int) -> Bool
    mutating func changeItemName(_ itemID: String, _ newName: String)
    mutating func changeItemDescription(_ itemID: String, _ newDescription: String)
    mutating func chanageItemCategory(_ itemID: String, _ newCategory: Item.Category)
    mutating func changeItemCostPerDay(_ itemID: String, _ newItemCostPerDay: String) throws
    mutating func removeItem(_ itemID: String) throws
    func calculateCost(_ itemID: String, _ days: Int) -> Int
}

protocol ContractFunctions {
    mutating func createContract(_ itemID: String, _ contract: Contract)
}
