//
//  File.swift
//  
//
//  Created by Alex on 2022-09-16.
//

import Foundation

struct Member: Identifiable {
    private(set) var id = UUID().uuidString.prefix(6)
    private(set) var name: String
    private(set) var email: String
    private(set) var mobilePhone: String
    private(set) var ownedItems: Array<Item?>
   
    init(name: String, email: String, mobilePhone: String, ownedItems: Array<Item?>) {
        self.name = name
        self.email = email
        self.mobilePhone = mobilePhone
        self.ownedItems = ownedItems
    }
    
    func checkEmail() {
        
    }
    
    func checkPhoneNumber() {
        
    }
    
}
