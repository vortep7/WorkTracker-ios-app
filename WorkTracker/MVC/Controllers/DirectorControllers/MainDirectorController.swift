//
//  MainDirectorController.swift
//  WorkTracker
//
//  Created by Андрей Петров on 06.04.2024.
//import CoreLocation

import Firebase
import UIKit
import CoreBluetooth

class MainDirectorController: UIViewController,CBCentralManagerDelegate {
    var authView: MainDirectorView {return self.view as! MainDirectorView}
    var mainDirectorCoordinator: Coordinator
    var centralManager: CBCentralManager!
    var uniquePeripheralNames: Set<String> = [] // Массив для хранения уникальных названий Bluetooth устройств
    
    init(mainDirectorCoordinator: Coordinator) {
        self.mainDirectorCoordinator = mainDirectorCoordinator
        super.init(nibName: nil, bundle: Bundle.main)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    override func loadView() {
        self.view = MainDirectorView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        authView.onNumberAction = {[weak self] in self?.dele()}
    }
}

extension MainDirectorController {
    @objc func dele() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("error")
        }
    }
}

extension MainDirectorController {
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
        case .poweredOn:
            print("Bluetooth включен. Начинаю сканирование...")
            // Начинаем сканирование Bluetooth устройств
            central.scanForPeripherals(withServices: nil, options: nil)
            
            // Запускаем таймер для завершения сканирования через 5 секунд
            Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false) { timer in
                self.centralManager.stopScan()
                print("Сканирование завершено. Вывод уникальных названий Bluetooth устройств:")
                self.printUniquePeripheralNames()
            }
            
        case .poweredOff:
            print("Bluetooth выключен.")
            // Печатаем массив уникальных названий Bluetooth устройств в случае выключения Bluetooth
            printUniquePeripheralNames()
        case .resetting:
            print("Bluetooth сбрасывается.")
        case .unauthorized:
            print("Bluetooth не авторизован для использования.")
        case .unknown:
            print("Состояние Bluetooth неизвестно.")
        case .unsupported:
            print("Bluetooth не поддерживается.")
        @unknown default:
            print("Неизвестное состояние Bluetooth.")
        }
    }
    
    // Метод делегата CBCentralManagerDelegate, вызывается при обнаружении Bluetooth устройства
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        guard let peripheralName = peripheral.name else {
            return // Если имя устройства отсутствует, выходим из метода
        }
        
        if !uniquePeripheralNames.contains(peripheralName) {
            uniquePeripheralNames.insert(peripheralName)
            print("Найдено Bluetooth устройство: \(peripheralName)")
            // Здесь вы можете обрабатывать найденные устройства, например, добавлять их в массив для дальнейшего использования
        }
    }
    
    // Функция для печати массива уникальных названий Bluetooth устройств
    func printUniquePeripheralNames() {
        print("Уникальные названия Bluetooth устройств:")
        for peripheralName in uniquePeripheralNames {
            print(peripheralName)
        }
    }
}



    
