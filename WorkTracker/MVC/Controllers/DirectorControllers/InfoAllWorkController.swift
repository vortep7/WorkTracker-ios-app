//
//  InfoAllWorkController.swift
//  WorkTracker
//
//  Created by Андрей Петров on 09.04.2024.
//

import Foundation
import UIKit
import Firebase

class InfoAllWorkController: UIViewController {
    var authView: InfoAllWorkView {return self.view as! InfoAllWorkView}
    let source = CoreDataManager.shared.fetchAllReport()
    var muArray:[MyNewUser] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        authView.tableView.dataSource = self
        authView.tableView.delegate = self
        authView.tableView.register(InfoAllWorkers.self, forCellReuseIdentifier: "\(InfoAllWorkers.self)")
        
    }
    
    override func loadView() {
        self.view = InfoAllWorkView(frame: UIScreen.main.bounds)
        
        
        for element in source {
            let t = element.info?.contains("работник")
            if t! {
                muArray.append(element)
            }
        }
        
    }
    
}


extension InfoAllWorkController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var savedTasks = UserDefaults.standard.array(forKey: Auth.auth().currentUser!.uid.dropFirst() + "_LostWorker") as? [String] ?? ["none"]
        var uid = muArray[indexPath.row].uid
        savedTasks.append(uid!)
        UserDefaults.standard.set(savedTasks, forKey: Auth.auth().currentUser!.uid.dropFirst() + "_LostWorker")
        
    }
}

extension InfoAllWorkController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return muArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(InfoAllWorkers.self)", for: indexPath) as! InfoAllWorkers
        
        let user = muArray[indexPath.row]
                
        cell.reason.text = "Name: " + user.name!
        cell.date.text = "Email: " + user.email!
        cell.kind.text = "Infornation: " + user.info!
        
        return cell
    }
}


