//
//  NumberManager.swift
//  WorkTracker
//
//  Created by Андрей Петров on 06.04.2024.
//

import Foundation

class NumberManager {
    static let shared = NumberManager()
    private init() {}
    
    func isValidPhoneNumber(_ phoneNumber: String) -> Bool {
        let cleanedPhoneNumber = phoneNumber.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        return cleanedPhoneNumber.hasPrefix("7") && cleanedPhoneNumber.count == 11
    }
}
