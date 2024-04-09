//
//  InfoTimeController.swift
//  WorkTracker
//
//  Created by Андрей Петров on 09.04.2024.
//
import UIKit
import Foundation

class InfoTimeController: UIViewController {
    var authView: InfoTimeView {return self.view as! InfoTimeView}
    let source = CoreDataManager.shared.fetchAllReport()
    var muArray:[MyNewUser] = []

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
                print(element.info)
                muArray.append(element)
            }
        }
        
    }
    
}


extension InfoTimeController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}

extension InfoTimeController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return muArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(GetTaskTable.self)", for: indexPath) as! GetTaskTable
        
        let user = muArray[indexPath.row]
        
        print(user.info)
        print(user.name)
        print(user.email)
        
        print(source.count)
        cell.reason.text = "ФИО: " + user.name!
        cell.date.text = "Почта: " + user.email!
        cell.kind.text = "Информация: " + user.info!
        
        return cell
    }
}

