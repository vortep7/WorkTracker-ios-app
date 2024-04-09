//
//  HoursDirectorController.swift
//  WorkTracker
//
//  Created by Андрей Петров on 08.04.2024.
//
import Firebase
import SwiftUI
import UIKit
class HoursDirectorController: UIViewController, BluetoothScannerDelegate {
    var hoursWorkerView: HoursWorkerView?
    var bluetoothScanner: BluetoothScanner?
    var timer: Timer?
    var labelText: Int = 0 {
        didSet {
            let formattedTime = timeFromSeconds(labelText)
            hoursWorkerView?.label.text = formattedTime
        }
    }

    var firstDigit: Double = UserDefaults.standard.double(forKey: Auth.auth().currentUser!.uid.dropFirst() + "_daysTimeStart")
    var secondDigit: Double = UserDefaults.standard.double(forKey: Auth.auth().currentUser!.uid.dropFirst() + "_daysTimeStop")
    var dayProfit: Double = UserDefaults.standard.double(forKey: Auth.auth().currentUser!.uid.dropFirst() + "_daysTimeProfit")

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = HoursWorkerView(frame: UIScreen.main.bounds)
        hoursWorkerView = self.view as? HoursWorkerView

        if firstDigit < 0 {
            firstDigit = 100.0
        }
        
        if secondDigit == 0 {
            secondDigit = 0.0
        }
        print(self.secondDigit)
        if secondDigit == 100 {
            secondDigit = 0
        }
        
        bluetoothScanner = BluetoothScanner()
        bluetoothScanner?.delegate = self
        
        print(firstDigit)
        print(secondDigit)

        bluetoothScanner?.startScanning()
    
        configFirstDiagram(with: WorkerDayDiagram(data: [self.firstDigit,self.secondDigit]))
        configSecondDiagram()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func didFindRequiredDevice() {
        
        if secondDigit < 100 {
            labelText += 20
            self.firstDigit = self.firstDigit - 20
            self.secondDigit = self.secondDigit + 20
            print(self.firstDigit)
            print(self.secondDigit)
            UserDefaults.standard.set(firstDigit, forKey: Auth.auth().currentUser!.uid.dropFirst() + "_daysTimeStart")
            UserDefaults.standard.set(secondDigit, forKey: Auth.auth().currentUser!.uid.dropFirst() + "_daysTimeStop")
            UserDefaults.standard.set(firstDigit, forKey: Auth.auth().currentUser!.uid.dropFirst() + "_daysTimeProfit")

            let contentView = WorkerDayDiagram(data: [self.firstDigit, self.secondDigit])
            configFirstDiagram(with: contentView)
        } else {
            labelText += 20
            self.firstDigit = 100
            self.secondDigit = 0
        }
    }
    
    func timeFromSeconds(_ seconds: Int) -> String {
        let hours = seconds / 3600
        let minutes = (seconds % 3600) / 60
        let remainSeconds = seconds % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, remainSeconds)
    }
}
extension HoursDirectorController {
    
    func configFirstDiagram(with contentView: WorkerDayDiagram) {
        let hostingController = UIHostingController(rootView: contentView)
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 65),
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor, constant: 350),
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
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor, constant: 550),
            hostingController.view.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2),
            hostingController.view.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2)
        ])
        hostingController.didMove(toParent: self)
    }
}

