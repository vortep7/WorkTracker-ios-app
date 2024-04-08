//
//  MainWorkerController.swift
//  WorkTracker
//
//  Created by Андрей Петров on 06.04.2024.
//
import Firebase
import UIKit
import CoreBluetooth

class MainWorkerController: UIViewController, CBCentralManagerDelegate {
    var mainWorkerCoordinator: MainWorkCoordProtocol
    var authView: MainWorkerView {return self.view as! MainWorkerView}
    var centralManager: CBCentralManager!
    var uniquePeripheralNames: Set<String> = []
    
    init(mainWorkerCoordinator: MainWorkCoordProtocol) {
        self.mainWorkerCoordinator = mainWorkerCoordinator
        super.init(nibName: nil, bundle: Bundle.main)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        authView.onNumberAction = {[weak self] in self?.dele()}
        authView.onNextAction = {[weak self] in self?.nextController()}
    }
    
    override func loadView() {
        self.view = MainWorkerView(frame: UIScreen.main.bounds)
    }
    
}

extension MainWorkerController {
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

extension MainWorkerController {
    @objc func dele() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("error")
        }
    }
    
    @objc func nextController() {
        mainWorkerCoordinator.goNext()
    }
}
