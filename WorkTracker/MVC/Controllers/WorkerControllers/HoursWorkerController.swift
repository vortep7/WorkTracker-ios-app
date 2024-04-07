//
//  HoursWorkerController.swift
//  WorkTracker
//
//  Created by Андрей Петров on 07.04.2024.
//
import UIKit


import UIKit
import UIKit

class HoursWorkerController: UIViewController, BluetoothScannerDelegate {
    var hoursWorkerView: HoursWorkerView?
    var bluetoothScanner: BluetoothScanner?
    var timer: Timer?
    var labelText: Int = 0 {
        didSet {
            let formattedTime = formatTimeFromSeconds(labelText)
            hoursWorkerView?.label.text = formattedTime
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = HoursWorkerView(frame: UIScreen.main.bounds)
        hoursWorkerView = self.view as? HoursWorkerView
        
        // Создаем экземпляр BluetoothScanner и устанавливаем его делегатом
        bluetoothScanner = BluetoothScanner()
        bluetoothScanner?.delegate = self
        
        // Запускаем сканирование Bluetooth устройств
        bluetoothScanner?.startScanning()
    }
    
    // Реализация метода делегата BluetoothScannerDelegate
    func didFindRequiredDevice() {
        labelText += 20
    }
    
    // Метод для форматирования времени из секунд в строку в формате часы:минуты:секунды
    func formatTimeFromSeconds(_ seconds: Int) -> String {
        let hours = seconds / 3600
        let minutes = (seconds % 3600) / 60
        let remainingSeconds = seconds % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, remainingSeconds)
    }
}
