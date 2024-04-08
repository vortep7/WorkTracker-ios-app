//
//  InfoDirectorController.swift
//  WorkTracker
//
//  Created by Андрей Петров on 08.04.2024.
//

import UIKit

class InfoDirectorController: UIViewController {
    var authView: InfoDirectorView {return self.view as! InfoDirectorView}
    let source = DirectorsArray().array
    override func viewDidLoad() {
        super.viewDidLoad()
        
        authView.tableView.delegate = self
        authView.tableView.dataSource = self

        authView.tableView.register(InfoDirectorTable.self, forCellReuseIdentifier: "\(InfoDirectorTable.self)")
    }
    
    override func loadView() {
        self.view = InfoDirectorView(frame: UIScreen.main.bounds)
    }
    
}

extension InfoDirectorController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}

extension InfoDirectorController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return source.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(InfoDirectorTable.self)", for: indexPath) as! InfoDirectorTable
        
        
        return cell
    }
}

