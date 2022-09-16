//
//  File.swift
//  
//
//  Created by Alex on 2022-09-16.
//

import Foundation

struct System {
    private(set) var members: [Member] = []
    
    mutating func addNewMember(_ member: Member) {
        members.append(member)
    }
    
    
    
}
