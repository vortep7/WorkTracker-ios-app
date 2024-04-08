//
//  HoursWorkerController.swift
//  WorkTracker
//
//  Created by Андрей Петров on 07.04.2024.
//

import SwiftUI
import UIKit

class HoursWorkerController: UIViewController, BluetoothScannerDelegate {
    var hoursWorkerView: HoursWorkerView?
    var bluetoothScanner: BluetoothScanner?
    var timer: Timer?
    var labelText: Int = 0 {
        didSet {
            let formattedTime = timeFromSeconds(labelText)
            hoursWorkerView?.label.text = formattedTime
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = HoursWorkerView(frame: UIScreen.main.bounds)
        hoursWorkerView = self.view as? HoursWorkerView
        
        bluetoothScanner = BluetoothScanner()
        bluetoothScanner?.delegate = self
        
        bluetoothScanner?.startScanning()
    
        configFirstDiagram()
        configSecondDiagram()
    }
    
    func didFindRequiredDevice() {
        labelText += 20
    }
    
    func timeFromSeconds(_ seconds: Int) -> String {
        let hours = seconds / 3600
        let minutes = (seconds % 3600) / 60
        let remainSeconds = seconds % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, remainSeconds)
    }
}

extension HoursWorkerController {

    func configFirstDiagram() {
        let contentView = WorkerDayDiagram()
        let hostingController = UIHostingController(rootView: contentView)
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 65),
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor, constant: 350), // Отступ от верхней границы
            hostingController.view.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2),
            hostingController.view.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2)
        ])
        hostingController.didMove(toParent: self)
    }
    
    func configSecondDiagram() {
        let contentView = WorkerFullDiagram()
        let hostingController = UIHostingController(rootView: contentView)
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -65),
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor, constant: 550), // Отступ от верхней границы
            hostingController.view.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2),
            hostingController.view.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2)
        ])
        hostingController.didMove(toParent: self)
    }
}

