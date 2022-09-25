//
//  File.swift
//  
//
//  Created by Alex on 2022-09-16.
//

import Foundation

func mainMenuActions(console: Console, system: inout System) {
    var run = true

    while run {
        let action: Console.Actions = console.mainMenu()

        switch action {
        case .member:
            memberMenuActions(system: &system)
        case .item:
            itemMenuActions(system: &system)
        case .advanceDay:
            system.increaseDay()
        case .quit:
            run = false
        }
    }
}
