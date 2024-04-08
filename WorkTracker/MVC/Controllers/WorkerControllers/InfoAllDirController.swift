//
//  InfoAllDirController.swift
//  WorkTracker
//
//  Created by Андрей Петров on 08.04.2024.
//

import UIKit

class InfoAllDirController: UIViewController {
    var authView: InfoAllDirectorView {return self.view as! InfoAllDirectorView}
    let source = CoreDataManager.shared.fetchAllReport()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        authView.tableView.dataSource = self
        authView.tableView.delegate = self
        authView.tableView.register(InfoAllDirectors.self, forCellReuseIdentifier: "\(InfoAllDirectors.self)")

    }
    
    override func loadView() {
        self.view = InfoAllDirectorView(frame: UIScreen.main.bounds)
    }

}


extension InfoAllDirController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}

extension InfoAllDirController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var array:Int = 0
        for i in source {
            if ((i.email?.contains("director")) != nil) {
                array += 1
            }
        }
        
        return array
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(InfoAllDirectors.self)", for: indexPath) as! InfoAllDirectors
        let user = source[indexPath.row]

        if ((user.email?.contains("director")) != nil) {
            cell.reason.text = "ФИО: " + user.name!
            cell.date.text = "Почта: " + user.email!
            cell.kind.text = "Информация: " + user.info!
        }
        
        return cell
    }
}


