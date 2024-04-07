//
//  BluetoothManager.swift
//  WorkTracker
//
//  Created by Андрей Петров on 07.04.2024.
//

import Foundation

class BluetoothManager {
    static let shared = BluetoothManager()
    private init() {}
    
    private var neededBlueTooth = "Алиса Пупсень"
    
    func checkConnection(_ arrayOfBluetooth:Set<String>) -> Bool {
        if arrayOfBluetooth.contains(neededBlueTooth) {
            return true
        } else {
            return false
        }
    }
    
    
}
