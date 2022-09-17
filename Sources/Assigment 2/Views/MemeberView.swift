//
//  File.swift
//  
//
//  Created by Alex on 2022-09-16.
//

import Foundation

struct MemberView {
    enum Actions {
        case name
        case email
        case phoneNumber
        case back
    }

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

    func reenterName() -> String {
        print("Insert new name: ", terminator: "")
        let email = readLine() ?? ""
        return email
    }

    func reenterEmail() -> String {
        print("Insert new email: ", terminator: "")
        let email = readLine() ?? ""
        return email
    }

    func reenterPhoneNumber() -> String {
        print("Insert new phone number: ", terminator: "")
        let phoneNumber = readLine() ?? ""
        return phoneNumber
    }

    // MARK: - Creating the member

    func createNewMember(_ members: [Member]) -> Member? {
        let name = getMemerName()
        var email = getMemerEmail()
        var phoneNumber = getMemberPhoneNumber()
        var status = true

        repeat {
            do {
                let newMember = try Member(name: name,
                                           email: email,
                                           mobilePhone: phoneNumber,
                                           ownedItems: [Item](),
                                           credits: 0, members: members)
                status = false
                return newMember
            } catch MemberParseError.usedEmail {
                print("-- Email already used --")
                email = reenterEmail()
                status = true
            } catch MemberParseError.usedPhoneNumber {
                print("-- Phone Number is used --")
                phoneNumber = reenterPhoneNumber()
                status = true
            } catch {
                print("Other Error")
                return nil
            }
        } while (status)
        return nil
    }

    // MARK: - Member actions

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
        readLine()
    }

    func changeUserInformation() -> Actions {
        print("\n1. Name")
        print("2. Email")
        print("3. Phone Number")
        print("b. Back")
        print("What do you want to change?: ", terminator: "")
        let choice = readLine()
        if choice == "1" {
            return Actions.name
        } else if choice == "2" {
            return Actions.email
        } else if choice == "3" {
            return Actions.phoneNumber
        }
        return Actions.back
    }
}
