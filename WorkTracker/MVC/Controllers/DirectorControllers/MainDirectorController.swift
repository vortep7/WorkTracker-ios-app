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
    var mainDirectorCoordinator: MainDirCoordProtocol
    var centralManager: CBCentralManager!
    var uniquePeripheralNames: Set<String> = []
    
    init(mainDirectorCoordinator: MainDirCoordProtocol) {
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
        authView.onNextAction = {[weak self] in self?.nextController()}
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
    
    @objc func nextController() {
        mainDirectorCoordinator.goNext()
    }
}

extension MainDirectorController {
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
        case .poweredOn:
            print(WordsForBluetoothState.start.rawValue)
            central.scanForPeripherals(withServices: nil, options: nil)
            
            Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { timer in
                self.centralManager.stopScan()
                print(WordsForBluetoothState.end.rawValue)
                self.printUniquePeripheralNames()
                print(BluetoothManager.shared.checkConnection(self.uniquePeripheralNames))
            }
            
        case .poweredOff:
            print(WordsForBluetoothState.normal.rawValue)
            printUniquePeripheralNames()
        @unknown default:
            print(WordsForBluetoothState.error.rawValue)
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        guard let peripheralName = peripheral.name else {
            return
        }
        
        if !uniquePeripheralNames.contains(peripheralName) {
            uniquePeripheralNames.insert(peripheralName)
            print(WordsForBluetoothState.search.rawValue + peripheralName)
        }
    }
    
    func printUniquePeripheralNames() {
        print(WordsForBluetoothState.uniqe.rawValue)
        for peripheralName in uniquePeripheralNames {
            print(peripheralName)
        }
    }
}

