//
//  File.swift
//  
//
//  Created by Alex on 2022-09-16.
//

import Foundation

struct MainMenuController {
    func mainMenuActions(system: inout System) {
        var run = true

        while run {
            let action: Console.Actions = Console().mainMenu()

            switch action {
            case .member:
                MemberController().memberMenuActions(system: &system)
            case .item:
                ItemController().itemMenuActions(system: &system)
            case .advanceDay:
                system.increaseDay()
            case .quit:
                run = false
            }
        }
    }
}
