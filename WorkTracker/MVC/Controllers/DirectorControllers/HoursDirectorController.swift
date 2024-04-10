//
//  HoursDirectorController.swift
//  WorkTracker
//
//  Created by Андрей Петров on 08.04.2024.
//
import Firebase
import SwiftUI
import UIKit
import UserNotifications
import LocalAuthentication

class HoursDirectorController: UIViewController, BluetoothScannerDelegate {
    var authView: HoursDirectorView { return self.view as! HoursDirectorView }
    var hoursWorkerView: HoursWorkerView?
    var bluetoothScanner: BluetoothScanner?
    var timer: Timer?
    
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
        
        NetworkManager.shared.fetchData { result in
            switch result {
            case .success(let hiy):
                print("Received data: \(hiy)")
            case .failure(let error):
                print("Error occurred: \(error)")
            }
        }
        
        if secondDigit < 0 {
            secondDigit = 0.0
        }
        
        scheduleDailyNotifications { success, error in }
            
      
        bluetoothScanner = BluetoothScanner()
        bluetoothScanner?.delegate = self
        
        authView.onPersonAction = {[weak self] in self?.fullTimee()}
        authView.onChangeBluetooth = {[weak self] in self?.BluetoothScreen()}
        
        faceID()
        
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
    
    override func loadView() {
        self.view = HoursDirectorView(frame: UIScreen.main.bounds)
    }
    
    func didFindRequiredDevice() {
        
        if secondDigit < 100 {
            
            fullTime += 20
            labelText += 20
            self.firstDigit = self.firstDigit - 20
            self.secondDigit = self.secondDigit + 20
            var day = fullTime / 100

            print("полное время \(fullTime)" )
            print("количество дней \(Int(day))")
            UserDefaults.standard.set(day, forKey: (Auth.auth().currentUser?.uid.dropFirst() ?? "") + "_countOfFullDays")
            UserDefaults.standard.set(firstDigit, forKey: (Auth.auth().currentUser?.uid.dropFirst() ?? "") + "_daysTimeStart")
            UserDefaults.standard.set(secondDigit, forKey: (Auth.auth().currentUser?.uid.dropFirst() ?? "") + "_daysTimeStop")
            UserDefaults.standard.set(firstDigit, forKey: (Auth.auth().currentUser?.uid.dropFirst() ?? "") + "_daysTimeProfit")
            UserDefaults.standard.set(fullTime, forKey: (Auth.auth().currentUser?.uid.dropFirst() ?? "") + "_fullTime")

            let contentView = WorkerDayDiagram(data: [self.firstDigit, self.secondDigit])
            configFirstDiagram(with: contentView)
        } else {
            fullTime += 20
            labelText += 20
            self.firstDigit = 100
            self.secondDigit = 0
            var day = fullTime / 100 
            
            print("полное время \(fullTime)" )
            print("количество дней \(Int(day))")
            
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

extension HoursDirectorController {
    @objc func fullTimee(){
        let nextController = InfoTimeController()
        present(nextController, animated: true)
    }
    
    @objc func BluetoothScreen(){
        let nextController = BluetoothController()
        present(nextController, animated: true)
    }
}

//MARK: - notification center
extension HoursDirectorController {
    func scheduleDailyNotifications(completion: @escaping (Bool, Error?) -> ()) {
        let center = UNUserNotificationCenter.current()
        
        center.removeAllPendingNotificationRequests()
        
        let content = UNMutableNotificationContent()
        content.title = "Хорошего дня!"
        content.body = "Не забудьте посмотреть свои задачи на сегодня."
        content.sound = UNNotificationSound.default
        content.categoryIdentifier = "GoodMorningCategory"
        
        if let imageURL = Bundle.main.url(forResource: "yes", withExtension: "png") {
            do {
                let attachment = try UNNotificationAttachment(identifier: "imageAttachment", url: imageURL, options: nil)
                content.attachments = [attachment]
            } catch {
                print("Ошибка при создании вложения для изображения: \(error.localizedDescription)")
            }
        }
        
        var dateComponents = DateComponents()
        dateComponents.hour = 10
        dateComponents.minute = 00
        let trigger1 = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        dateComponents.hour = 18
        let trigger2 = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let request1 = UNNotificationRequest(identifier: "MorningNotification", content: content, trigger: trigger1)
        let request2 = UNNotificationRequest(identifier: "EveningNotification", content: content, trigger: trigger2)
        
        center.add(request1) { error in
            if let error = error {
                completion(false, error)
                print("Ошибка в утреннем")
            } else {
                print("Утреннее добавлено")
            }
        }
        
        center.add(request2) { error in
            if let error = error {
                completion(false, error)
                print("Ошибка в вечернем")
            } else {
                print("Вечернее добавлено")
            }
        }
    }
}


extension HoursDirectorController {
    private func faceID() {
        let context = LAContext()
        var error: NSError?

        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Включение фейс айди"
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason ) { success, error in

                if success {
                    DispatchQueue.main.async { [unowned self] in
                        print("авторизован")
                    }
                }
            }
        } else {
            print("ошибка авторизации")
        }
    }
}
