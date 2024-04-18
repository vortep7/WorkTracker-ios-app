//
//  Scanner.swift
//  WorkTracker
//
//  Created by Андрей Петров on 07.04.2024.
//

import Foundation
import CoreBluetooth
import FirebaseAuth
import UserNotifications
import LocalAuthentication

class BluetoothScanner: NSObject, CBCentralManagerDelegate {
    let centralManager: CBCentralManager
    var foundPeripheralNames: [String] = []
    var second = 0
    weak var delegate: BluetoothScannerDelegate?
    
    var count = 1

    static var requiredDevices = UserDefaults.standard.array(forKey: "director") as? [String] ?? ["none"]

    override init() {
        self.centralManager = CBCentralManager(delegate: nil, queue: nil)
        super.init()
        self.centralManager.delegate = self
    }

    func scanForBluetoothDevices() {
        print("Начало сканирования Bluetooth устройств...")
        centralManager.scanForPeripherals(withServices: nil, options: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.centralManager.stopScan()
            print("Сканирование завершено. Найдено устройств: \(self.foundPeripheralNames.count)")
            self.checkForRequiredDevices()
            self.foundPeripheralNames.removeAll()
        }
    }


    func checkForRequiredDevices() {
        for deviceName in self.foundPeripheralNames {
            if BluetoothScanner.requiredDevices.contains(deviceName) {
                print("Найдено нужное устройство: \(deviceName)")
                delegate?.didFindRequiredDevice()
            }
        }
    }

    func startScanning() {
        let timer = Timer(timeInterval: 20.0, repeats: true) { _ in
            self.scanForBluetoothDevices()
        }
        RunLoop.current.add(timer, forMode: .common)
        scanForBluetoothDevices()
        if count == 1 {
            count += 1
        }
        
    }

    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            print("Bluetooth включен")
        } else {
            print("Bluetooth не доступен")
        }
    }

    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        guard let peripheralName = peripheral.name else {
            return
        }

        if !foundPeripheralNames.contains(peripheralName) {
            foundPeripheralNames.append(peripheralName)
            print("Найдено Bluetooth устройство: \(peripheralName)")
        }
    }
    
}




