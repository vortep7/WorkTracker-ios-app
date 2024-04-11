//
//  InfoWorkerController.swift
//  WorkTracker
//
//  Created by Андрей Петров on 08.04.2024.
//

import UIKit
import Firebase
class InfoWorkerController: UIViewController {
    var authView: InfoWorkerView {return self.view as! InfoWorkerView}

    var savedTasks = UserDefaults.standard.array(forKey: Auth.auth().currentUser!.uid.dropFirst() + "_LostWorker") as? [String] ?? ["none"]
    var days = 0.0
    var times = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        authView.tableView.delegate = self
        authView.tableView.dataSource = self
        authView.tableView.register(InfoDirectorTable.self, forCellReuseIdentifier: "\(InfoDirectorTable.self)")
        authView.onNumberAction = {[weak self] in self?.actionButton()}
        
        for element in 0..<savedTasks.count {
            let uid = savedTasks[element]
            
            let fullDays = UserDefaults.standard.double(forKey: uid.dropFirst() + "_Days")
            let fullTimes = UserDefaults.standard.double(forKey: uid.dropFirst() + "_Full")

            let roundedFullDays = (fullDays * 10).rounded() / 10
            let roundedFullTimes = (fullTimes * 10).rounded() / 10
            
            days += roundedFullDays
            times += roundedFullTimes
        }
        
        if savedTasks.count == 0 {
            authView.label.text = "0.0 % from the general norm"
        } else {
            let count = (days / Double((savedTasks.count * 100)) * 100).rounded()
            authView.label.text = "\(count) % from the general norm"
        }

    }
    
    override func loadView() {
        self.view = InfoWorkerView(frame: UIScreen.main.bounds)
    }
    
}

extension InfoWorkerController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}

extension InfoWorkerController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedTasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(InfoDirectorTable.self)", for: indexPath) as! InfoDirectorTable
        
        cell.backgroundColor = .white
        let uid = savedTasks[indexPath.row]
        do {
            let users = try CoreDataManager.shared.newRequest(for: uid)
            
            for element in users {
                cell.reason.text = element.name
                cell.imageViewMy.image = UIImage(named: "workk")
            }
        } catch {
            print("error")
        }
        return cell
    }
    
}

extension InfoWorkerController {
    @objc func actionButton() {
        UserDefaults.standard.set([], forKey: Auth.auth().currentUser!.uid.dropFirst() + "_LostWorker")
        savedTasks = []
        authView.tableView.reloadData()
        authView.label.text = "0.0 % from the general norm"
    }
}
