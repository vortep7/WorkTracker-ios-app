//
//  InfoAllWorkController.swift
//  WorkTracker
//
//  Created by Андрей Петров on 09.04.2024.
//

import Foundation
import UIKit

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
                print(element.info)
                muArray.append(element)
            }
        }
        
    }
    
}


extension InfoAllWorkController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}

extension InfoAllWorkController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return muArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(InfoAllWorkers.self)", for: indexPath) as! InfoAllWorkers
        
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


