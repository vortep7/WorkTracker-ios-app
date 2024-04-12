//
//  GetTaskController.swift
//  WorkTracker
//
//  Created by Андрей Петров on 09.04.2024.
//

import UIKit

class GetTaskController: UIViewController {
    var authView: GetTasksView {return self.view as! GetTasksView}
    let source = CoreDataManager.shared.fetchAllReport()
    var muArray:[MyNewUser] = []
    var fastView: newViewForText?
    var currentName: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        authView.tableView.dataSource = self
        authView.tableView.delegate = self
        authView.tableView.register(GetTaskTable.self, forCellReuseIdentifier: "\(GetTaskTable.self)")
        
    }
    
    override func loadView() {
        self.view = GetTasksView(frame: UIScreen.main.bounds)
        
        
        for element in source {
            let t = element.info?.contains("работник")
            if t! {
                muArray.append(element)
            }
        }
    }
}


extension GetTaskController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = muArray[indexPath.row]
        showPopup(for: user)
        tableView.deselectRow(at: indexPath, animated: true)
        currentName = muArray[indexPath.row].uid!
    }
}

extension GetTaskController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return muArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(GetTaskTable.self)", for: indexPath) as! GetTaskTable
        
        let user = muArray[indexPath.row]
        cell.reason.text = "Name: " + user.name!
        cell.kind.text = "Email: " + user.email!
        cell.amount.text = "Info: " + user.info!
        return cell
    }
}


extension GetTaskController {
    func showPopup(for user: MyNewUser) {
        fastView = newViewForText(frame: UIScreen.main.bounds)
        fastView?.titleLabel.text = "Enter the text"
        fastView?.confirmButton.setTitle("Save", for: .normal)
        fastView?.confirmButton.tintColor = .white
        fastView?.confirmAction = { [weak self] text in
            
            print(text)
            
            let separatedComponents = text.components(separatedBy: "Дедлайн: ")
            if separatedComponents.count > 1 {
                let secondComponent = separatedComponents[1]
                
                let numericComponents = secondComponent.components(separatedBy: CharacterSet.decimalDigits.inverted)
                
                if numericComponents.count >= 2, let firstNumber = Int(numericComponents[0]), let secondNumber = Int(numericComponents[1]) {
                    print("Первое число после Дедлайн: \(firstNumber)")
                    print("Второе число после Дедлайн: \(secondNumber)")
                    
                    self?.scheduleSingleNotification(at: firstNumber, minute: secondNumber, message: text) { result, error in
                        if let error = error {
                            print(error)
                        } else {
                            print(result)
                        }
                    }
                } else {
                    print("Числа после Дедлайн не найдены или их меньше двух")
                }
            } else {
                print("Фраза 'Дедлайн:' не найдена")
            }
            
            var textArray = UserDefaults.standard.array(forKey: self!.currentName.dropFirst() + "_Pop") as? [String] ?? []
            textArray.append(text)
            UserDefaults.standard.set(textArray, forKey: self!.currentName.dropFirst() + "_Pop")
            self?.fastView?.textField.text = ""
            self?.fastView?.removeFromSuperview()
            self?.fastView = nil
        }
        view.addSubview(fastView!)
    }
}

extension GetTaskController {
    func scheduleSingleNotification(at hour: Int, minute: Int, message: String, completion: @escaping (Bool, Error?) -> ()) {
        let center = UNUserNotificationCenter.current()
        
        center.removeAllPendingNotificationRequests()
        
        let content = UNMutableNotificationContent()
        content.title = "Хорошего дня!"
        content.body = message
        content.sound = UNNotificationSound.default
        content.categoryIdentifier = "GoodMorningCategory"

        var dateComponents = DateComponents()
        dateComponents.hour = hour
        dateComponents.minute = minute
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        let request = UNNotificationRequest(identifier: "SingleNotification", content: content, trigger: trigger)
        
        center.add(request) { error in
            if let error = error {
                completion(false, error)
                print("Ошибка в добавлении уведомления")
            } else {
                completion(true, nil)
                print("Уведомление добавлено")
            }
        }
    }
}
