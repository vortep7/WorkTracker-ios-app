//
//  HoursWorkerController.swift
//  WorkTracker
//
//  Created by Андрей Петров on 07.04.2024.
//
import Firebase
import SwiftUI
import UIKit
import UserNotifications
import LocalAuthentication

class HoursWorkerController: UIViewController, BluetoothScannerDelegate {
    var authView: HoursWorkerView { return self.view as! HoursWorkerView }
    var bluetoothScanner: BluetoothScanner?
    var timer: Timer?
    var flag = true
    var t = 0
    var c = 0
    var manager = NotificationManager()
    
    var labelText: Int = 0 {
        didSet {
            let formattedTime = timeFromSeconds(labelText)
            authView.label.text = formattedTime
        }
    }
    
    var fullTime: Double = UserDefaults.standard.double(forKey: Auth.auth().currentUser!.uid.dropFirst() + "_fullTime")
    var firstDigit: Double = UserDefaults.standard.double(forKey: Auth.auth().currentUser!.uid.dropFirst() + "_daysTimeStart")
    var secondDigit: Double = UserDefaults.standard.double(forKey: Auth.auth().currentUser!.uid.dropFirst() + "_daysTimeStop")
    var dayProfit: Double = UserDefaults.standard.double(forKey: Auth.auth().currentUser!.uid.dropFirst() + "_daysTimeProfit")
    var countOfFullDays: Double = UserDefaults.standard.double(forKey: Auth.auth().currentUser!.uid.dropFirst() + "_countOfFullDays")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if firstDigit < 0 {
            firstDigit = 100.0
        }
        
        if secondDigit < 0 {
            secondDigit = 0.0
        }
        
        if firstDigit + secondDigit != 100 {
            firstDigit = 100.0
            secondDigit = 0.0
        }
        
        manager.scheduleDailyNotifications { result, error in
            if let error = error {
                print("error")
            } else {
                print("success")
            }
        }
        
        startFaceIDTimer()
        
        bluetoothScanner = BluetoothScanner()
        bluetoothScanner?.delegate = self
        
        authView.onPersonAction = {[weak self] in self?.fullTimee()}
        
        bluetoothScanner?.startScanning()
        
        configFirstDiagram(with: WorkerDayDiagram(data: [self.firstDigit,self.secondDigit]))
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        var firstArray = UserDefaults.standard.array(forKey: (Auth.auth().currentUser?.uid.dropFirst() ?? "") + "_endTime") as? [String] ?? []
        var secondArray = UserDefaults.standard.array(forKey: (Auth.auth().currentUser?.uid.dropFirst() ?? "") + "_beginTime") as? [String] ?? []
        
        if firstArray.count != secondArray.count {
            let currentTime = Date()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let currentTimeString = dateFormatter.string(from: currentTime)

            var dateArray = UserDefaults.standard.array(forKey: (Auth.auth().currentUser?.uid.dropFirst() ?? "") + "_endTime") as? [String] ?? []
            dateArray.append(currentTimeString)
            UserDefaults.standard.set(dateArray, forKey: (Auth.auth().currentUser?.uid.dropFirst() ?? "") + "_endTime")
            
        } else {
            print("одинаковы")
        }
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func loadView() {
        self.view = HoursWorkerView(frame: UIScreen.main.bounds)
    }
    
    func didFindRequiredDevice() {
        if self.flag {
            let currentTime = Date()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let currentTimeString = dateFormatter.string(from: currentTime)

            var dateArray = UserDefaults.standard.array(forKey: (Auth.auth().currentUser?.uid.dropFirst() ?? "") + "_beginTime") as? [String] ?? []
            dateArray.append(currentTimeString)
            UserDefaults.standard.set(dateArray, forKey: (Auth.auth().currentUser?.uid.dropFirst() ?? "") + "_beginTime")
            
            self.flag = false
        }
        
        if secondDigit < 100 {
            
            fullTime += 4
            labelText += 4
            self.firstDigit = self.firstDigit - 4
            self.secondDigit = self.secondDigit + 4
            var day = fullTime / 100
            
            
            UserDefaults.standard.set(day, forKey: (Auth.auth().currentUser?.uid.dropFirst() ?? "") + "_countOfFullDays")
            UserDefaults.standard.set(firstDigit, forKey: (Auth.auth().currentUser?.uid.dropFirst() ?? "") + "_daysTimeStart")
            UserDefaults.standard.set(secondDigit, forKey: (Auth.auth().currentUser?.uid.dropFirst() ?? "") + "_daysTimeStop")
            UserDefaults.standard.set(firstDigit, forKey: (Auth.auth().currentUser?.uid.dropFirst() ?? "") + "_daysTimeProfit")
            UserDefaults.standard.set(fullTime, forKey: (Auth.auth().currentUser?.uid.dropFirst() ?? "") + "_fullTime")
            
            let contentView = WorkerDayDiagram(data: [self.firstDigit, self.secondDigit])
            configFirstDiagram(with: contentView)
        } else {
            fullTime += 4
            labelText += 4
            self.firstDigit = 100
            self.secondDigit = 0
            var day = fullTime / 100
            
            
            UserDefaults.standard.set(day, forKey: (Auth.auth().currentUser?.uid.dropFirst() ?? "") + "_countOfFullDays")
            UserDefaults.standard.set(firstDigit, forKey: (Auth.auth().currentUser?.uid.dropFirst() ?? "") + "_daysTimeStart")
            UserDefaults.standard.set(secondDigit, forKey: (Auth.auth().currentUser?.uid.dropFirst() ?? "") + "_daysTimeStop")
            UserDefaults.standard.set(firstDigit, forKey: (Auth.auth().currentUser?.uid.dropFirst() ?? "") + "_daysTimeProfit")
            UserDefaults.standard.set(fullTime, forKey: (Auth.auth().currentUser?.uid.dropFirst() ?? "") + "_fullTime")
        }
    }
    
    func timeFromSeconds(_ seconds: Int) -> String {
        let hours = seconds / 3600
        let minutes = (seconds % 3600) / 60
        let remainSeconds = seconds % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, remainSeconds)
    }

    private func updateTimeAndDiagram() {
        guard secondDigit >= 4 else {
            return
        }
        
        DispatchQueue.main.async {
            self.fullTime -= 4
            self.labelText -= 4
            self.firstDigit += 4
            self.secondDigit -= 4
            
            UserDefaults.standard.set(self.fullTime, forKey: (Auth.auth().currentUser?.uid.dropFirst() ?? "") + "_fullTime")
            UserDefaults.standard.set(self.firstDigit, forKey: (Auth.auth().currentUser?.uid.dropFirst() ?? "") + "_daysTimeStart")
            UserDefaults.standard.set(self.secondDigit, forKey: (Auth.auth().currentUser?.uid.dropFirst() ?? "") + "_daysTimeStop")
            UserDefaults.standard.set(self.firstDigit, forKey: (Auth.auth().currentUser?.uid.dropFirst() ?? "") + "_daysTimeProfit")
            UserDefaults.standard.set(self.fullTime, forKey: (Auth.auth().currentUser?.uid.dropFirst() ?? "") + "_fullTime")
            
            let contentView = WorkerDayDiagram(data: [self.firstDigit, self.secondDigit])
            self.configFirstDiagram(with: contentView)
        }
    }

}
extension HoursWorkerController {
    
    func configFirstDiagram(with contentView: WorkerDayDiagram) {
        let hostingController = UIHostingController(rootView: contentView)
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 160),
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor, constant: 340),
            hostingController.view.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2),
            hostingController.view.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2)
        ])
        hostingController.didMove(toParent: self)
    }
}

extension HoursWorkerController {
    @objc func fullTimee(){
        let nextController = MyTimeController()
        present(nextController, animated: true)
    }
}

//MARK: - notification center
extension HoursWorkerController {
    private func startFaceIDTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 35.0, repeats: true) { [weak self] _ in
            self?.faceID()
        }
    }
}

//MARK: - FaceID config
extension HoursWorkerController {
    private func faceID() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            
            let reason = "Вход по Face ID"
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason, reply: { [weak self] success, error in
                if success {
                    DispatchQueue.main.async {
                        print("Успешная авторизация")
                    }
                } else {
                    if let error = error as NSError? {
                        DispatchQueue.main.async {
                            switch error.code {
                            case LAError.userFallback.rawValue:
                                print("Пользователь выбрал ввод пароля")
                            default:
                                print("Ошибка авторизации по Face ID: \(error.localizedDescription)")
                                self?.updateTimeAndDiagram()
                            }
                        }
                    }
                }
            })
            
        } else {
            print("Face ID недоступен")
        }
    }
}
