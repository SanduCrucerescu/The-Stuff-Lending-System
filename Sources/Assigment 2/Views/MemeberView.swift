//
//  File.swift
//  
//
//  Created by Alex on 2022-09-16.
//

import Foundation

struct MemberView {
    
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
                print("-- Email already used --")
                print("Please insert a new email: ", terminator: "")
                email = readLine() ?? ""
                status = true
            } catch MemberParseError.usedPhoneNumber {
                print("-- Phone Number is used --")
                print("Insert a new phone number: ", terminator: "")
                phoneNumber = readLine() ?? ""
                status = true
            } catch {
                print("Other Error")
                return nil
            }
        } while (status)
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
