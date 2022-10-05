//
//  File.swift
//  
//
//  Created by Alex on 2022-09-22.
//

import Foundation

extension String {
    var isNumber: Bool {
        return !isEmpty && rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
    }
    var double: Float? { Float(self) }
}
