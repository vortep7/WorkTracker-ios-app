//
//  Scanner.swift
//  WorkTracker
//
//  Created by Андрей Петров on 07.04.2024.
//

import Foundation
import CoreBluetooth



class BluetoothScanner: NSObject, CBCentralManagerDelegate {
    let centralManager: CBCentralManager
    var foundPeripheralNames: [String] = []
    var second = 0
    weak var delegate: BluetoothScannerDelegate?

    var staticView = HoursWorkerView()

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
        }
    }

    func checkForRequiredDevices() {
        let requiredDevices = ["MacBook Air — Андрей (3)", "Устройство2", "Устройство3"]
        for deviceName in self.foundPeripheralNames {
            if requiredDevices.contains(deviceName) {
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
    
    func formatTimeFromSeconds(_ seconds: Int) -> String {
        let minutes = seconds / 60
        let remainingSeconds = seconds % 60
        return "\(minutes) минута и \(remainingSeconds) секунд"
    }
}
