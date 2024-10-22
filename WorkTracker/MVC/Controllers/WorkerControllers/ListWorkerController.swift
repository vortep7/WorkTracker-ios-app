//
//  ListWorkerController.swift
//  WorkTracker
//
//  Created by Андрей Петров on 07.04.2024.
//
import Firebase
import UIKit

class ListWorkerController: UIViewController {
    
    var statisticView: ListWorkerView { return self.view as! ListWorkerView }
    var uid: String?
    var kind: String?
    var popArray: [String] = []
    var cellColors: [UIColor] = []
    var reverseArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        statisticView.collectionView.dataSource = self
        statisticView.collectionView.delegate = self
        statisticView.collectionView.register(FirstCollectionView.self, forCellWithReuseIdentifier: "\(FirstCollectionView.self)")
        
        if let storedPopArray = UserDefaults.standard.array(forKey: Auth.auth().currentUser!.uid.dropFirst() + "_Pop") as? [String] {
            popArray = storedPopArray
        }
        
        reverseArray = popArray.reversed()
        statisticView.onReloadAction = {[weak self] in self?.uploadData()}
        loadCellColors()
    }
    
    override func loadView() {
        self.view = ListWorkerView(frame: UIScreen.main.bounds)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

extension ListWorkerController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return popArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(FirstCollectionView.self)", for: indexPath) as? FirstCollectionView else {
            return UICollectionViewCell()
        }
        let user = popArray[indexPath.row]
        
        cell.quality.text = "Задание от директора"
        cell.plans.text = user
        
        cell.backgroundColor = cellColors[indexPath.row]
        cell.plans.numberOfLines = 3

        if cell.backgroundColor == UIColor.workTableRed {
            cell.imageView.image = UIImage(named: "error")
        } else {
            cell.imageView.image = UIImage(named: "yes")
        }

        return cell
    }

}

extension ListWorkerController:UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? FirstCollectionView else {
            return
        }
        
        if cell.backgroundColor == .workTableRed {
            cell.backgroundColor = .orange
        } else if cell.backgroundColor == .orange {
            cell.backgroundColor = .workTableGreen
        } else {
            cell.backgroundColor = .workTableRed
        }
        
        statisticView.collectionView.reloadData()
        saveCellColor(color: cell.backgroundColor ?? .workTableRed, atIndex: indexPath.row)
    }
}


extension ListWorkerController {
    func saveCellColor(color: UIColor, atIndex index: Int) {
        cellColors[index] = color
        UserDefaults.standard.set(color.encode(), forKey: (Auth.auth().currentUser?.uid.dropFirst())! + "_cellColor\(index)")
    }
    
    func loadCellColors() {
        cellColors = Array(repeating: .workTableRed, count: popArray.count)
        for index in 0..<popArray.count {
            if let colorData = UserDefaults.standard.data(forKey: (Auth.auth().currentUser?.uid.dropFirst())! + "_cellColor\(index)"),
               let color = UIColor.decode(colorData) {
                cellColors[index] = color
            }
        }
    }
}

extension UIColor {
    func encode() -> Data? {
        return try? NSKeyedArchiver.archivedData(withRootObject: self, requiringSecureCoding: false)
    }
    
    static func decode(_ data: Data) -> UIColor? {
        return try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? UIColor
    }
}

extension ListWorkerController {
    @objc func uploadData() {
        statisticView.collectionView.reloadData()
    }
}

extension ListWorkerController {
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
