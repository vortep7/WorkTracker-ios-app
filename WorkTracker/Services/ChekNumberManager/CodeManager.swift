//
//  CodeManager.swift
//  WorkTracker
//
//  Created by Андрей Петров on 06.04.2024.
//

import Foundation

class CodeManager {
    static let shared = CodeManager()
    private init() {}
    
    func isValidPassword(_ password: String) -> Bool {
        guard password.count == 6 else { return false }
        
        let digits = CharacterSet.decimalDigits
        guard password.rangeOfCharacter(from: digits.inverted) == nil else { return false }
        return true
    }
}
