//
//  ScannerCore.swift
//  WorkTracker
//
//  Created by Андрей Петров on 08.04.2024.
//

import Foundation

protocol BluetoothScannerDelegate: AnyObject {
    func didFindRequiredDevice()
}
