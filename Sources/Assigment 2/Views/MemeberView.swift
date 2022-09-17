//
//  File.swift
//  
//
//  Created by Alex on 2022-09-16.
//

import Foundation

struct MemberView {
    
    // MARK: - Getting the data for the user
    
    func getMemerName() -> String {
        print("Enter name: ", terminator: "")
        let name = readLine() ?? ""
    
        return name
    }
    
    func getMemerEmail() -> String {
        print("Enter email: ", terminator: "")
        let email = readLine() ?? ""
        
        return email
    }
    
    
    func getMemberPhoneNumber() -> String {
        print("Enter mobile phone number: ", terminator: "")
        let phoneNumber = readLine() ?? ""
        
        return phoneNumber
    }
    
    func reenterEmail() -> String {
        print("-- Email already used --")
        print("Please insert a new email: ", terminator: "")
        let email = readLine() ?? ""
        
        return email
    }
    
    func reenterPhoneNumber() -> String {
        print("-- Phone Number is used --")
        print("Insert a new phone number: ", terminator: "")
        let phoneNumber = readLine() ?? ""
        
        return phoneNumber
    }
    
    // MARK: - Creating the member
    
    func createNewMember() -> Member? {
        let name = getMemerName()
        var email = getMemerEmail()
        var phoneNumber = getMemberPhoneNumber()
        var status = true
        
        repeat {
            do {
                let newMember = try Member(name: name, email: email, mobilePhone: phoneNumber, ownedItems: [Item](), credits: 0)
                status = false
                return newMember
            } catch MemberParseError.usedEmail {
                email = reenterEmail()
                status = true
            } catch MemberParseError.usedPhoneNumber {
                phoneNumber = reenterPhoneNumber()
                status = true
            } catch {
                print("Other Error")
                return nil
            }
        } while (status)
        
        return nil
    }
    
    func deleteUser() -> String {
        print("Insert email of the user to delete: ", terminator: "")
        let email = readLine() ?? ""
        
        return email
    }
    
    func getMember() -> String {
        print("Enter owners email:", terminator: "")
        let email = readLine() ?? ""
        
        return email
    }
    
    func printMembers(_ member: String) {
        print(member)
    }
}
