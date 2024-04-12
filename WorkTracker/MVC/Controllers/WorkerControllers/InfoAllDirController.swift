//
//  InfoAllDirController.swift
//  WorkTracker
//
//  Created by Андрей Петров on 08.04.2024.
//
import Firebase
import UIKit

class InfoAllDirController: UIViewController {
    var authView: InfoAllDirectorView {return self.view as! InfoAllDirectorView}
    let source = CoreDataManager.shared.fetchAllReport()
    var newArray:[MyNewUser] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        authView.tableView.dataSource = self
        authView.tableView.delegate = self
        authView.tableView.register(InfoAllDirectors.self, forCellReuseIdentifier: "\(InfoAllDirectors.self)")
        
    }
    
    override func loadView() {
        self.view = InfoAllDirectorView(frame: UIScreen.main.bounds)
        
        for element in source {
            let t = element.info?.contains("директор")
            if t! {
                print(element.info)
                newArray.append(element)
            }
        }
        
    }
}
    
    extension InfoAllDirController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}

extension InfoAllDirController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return newArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(InfoAllDirectors.self)", for: indexPath) as! InfoAllDirectors
        let user = newArray[indexPath.row]
        
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


