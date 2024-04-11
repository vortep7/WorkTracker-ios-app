//
//  HoursWorkerController.swift
//  WorkTracker
//
//  Created by Андрей Петров on 07.04.2024.
//
import Firebase
import SwiftUI
import UIKit
import LocalAuthentication

class HoursWorkerController: UIViewController, BluetoothScannerDelegate {
    var authView: HoursWorkerView { return self.view as! HoursWorkerView }
    var hoursWorkerView: HoursWorkerView?
    var bluetoothScanner: BluetoothScanner?
    var timer: Timer?
    var labelText: Int = 0 {
        didSet {
            let formattedTime = timeFromSeconds(labelText)
            authView.label.text = formattedTime
        }
    }
    
    var fullTime: Double = UserDefaults.standard.double(forKey: Auth.auth().currentUser!.uid.dropFirst() + "_Full")
    var firstDigit: Double = UserDefaults.standard.double(forKey: Auth.auth().currentUser!.uid.dropFirst() + "_Start")
    var secondDigit: Double = UserDefaults.standard.double(forKey: Auth.auth().currentUser!.uid.dropFirst() + "_Stop")
    var dayProfit: Double = UserDefaults.standard.double(forKey: Auth.auth().currentUser!.uid.dropFirst() + "_Profit")
    var countOfFullDays: Double = UserDefaults.standard.double(forKey: Auth.auth().currentUser!.uid.dropFirst() + "_Days")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = HoursWorkerView(frame: UIScreen.main.bounds)
        
        if firstDigit < 0 {
            firstDigit = 100.0
        }
        
        if secondDigit < 0 {
            secondDigit = 0.0
        }
        
        if firstDigit + secondDigit == 0 {
            firstDigit = 100.0
            secondDigit = 0.0
        }
        
        
        scheduleDailyNotifications { success, error in }

        print(Auth.auth().currentUser!.uid.dropFirst() + "_Full")
        
        startFaceIDTimer()
        bluetoothScanner = BluetoothScanner()
        bluetoothScanner?.delegate = self
        print(firstDigit)
        print(secondDigit)
        bluetoothScanner?.startScanning()
    
        configFirstDiagram(with: WorkerDayDiagram(data: [self.firstDigit,self.secondDigit]))
        configSecondDiagram()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
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
            
            UserDefaults.standard.set(day, forKey: (Auth.auth().currentUser?.uid.dropFirst() ?? "") + "_Full")
            UserDefaults.standard.set(firstDigit, forKey: (Auth.auth().currentUser?.uid.dropFirst() ?? "") + "_Start")
            UserDefaults.standard.set(secondDigit, forKey: (Auth.auth().currentUser?.uid.dropFirst() ?? "") + "_Stop")
            UserDefaults.standard.set(firstDigit, forKey: (Auth.auth().currentUser?.uid.dropFirst() ?? "") + "_Profit")
            UserDefaults.standard.set(fullTime, forKey: (Auth.auth().currentUser?.uid.dropFirst() ?? "") + "_Days")

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
            
            UserDefaults.standard.set(day, forKey: (Auth.auth().currentUser?.uid.dropFirst() ?? "") + "_Full")
            UserDefaults.standard.set(firstDigit, forKey: (Auth.auth().currentUser?.uid.dropFirst() ?? "") + "_Start")
            UserDefaults.standard.set(secondDigit, forKey: (Auth.auth().currentUser?.uid.dropFirst() ?? "") + "_Stop")
            UserDefaults.standard.set(firstDigit, forKey: (Auth.auth().currentUser?.uid.dropFirst() ?? "") + "_Profit")
            UserDefaults.standard.set(fullTime, forKey: (Auth.auth().currentUser?.uid.dropFirst() ?? "") + "_Days")

        }
    }
    
    func timeFromSeconds(_ seconds: Int) -> String {
        let hours = seconds / 3600
        let minutes = (seconds % 3600) / 60
        let remainSeconds = seconds % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, remainSeconds)
    }
    
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
                                // Уменьшаем время на 20 и обновляем диаграмму
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

    private func updateTimeAndDiagram() {
        guard secondDigit >= 20 else {
            return
        }
        
        DispatchQueue.main.async {
            self.fullTime -= 20
            self.labelText -= 20
            self.firstDigit += 20
            self.secondDigit -= 20
            
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
    
    private func startFaceIDTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 30.0, repeats: true) { [weak self] _ in
            self?.faceID()
        }
    }
}


