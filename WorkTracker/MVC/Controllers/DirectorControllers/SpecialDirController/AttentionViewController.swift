//
//  AttentionViewController.swift
//  WorkTracker
//
//  Created by Андрей Петров on 12.04.2024.
//

import Foundation
import UIKit
import Firebase
class AttentionViewController: UIViewController {
    var start = [String]()
    var stop = [String]()
    var uid: String
    var name: String
    var authView: AttentionView {return self.view as! AttentionView}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        authView.tableView.dataSource = self
        authView.tableView.delegate = self
        authView.tableView.register(AttentionCollectionTable.self, forCellReuseIdentifier: "\(AttentionCollectionTable.self)")
        
        start = UserDefaults.standard.array(forKey: (uid.dropFirst()) + "_beginTime") as? [String] ?? []
        stop = UserDefaults.standard.array(forKey: (uid.dropFirst()) + "_endTime") as? [String] ?? []
        
        print(start)
        print(stop)
        
        print(start.count)
        print(stop.count)
        
        authView.label.text = name
    }
    
    override func loadView() {
        self.view = AttentionView(frame: UIScreen.main.bounds)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        authView.tableView.reloadData()
    }
    
    init(uid: String, name: String) {
        self.uid = uid
        self.name = name
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension AttentionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}


extension AttentionViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return start.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(AttentionCollectionTable.self)", for: indexPath) as! AttentionCollectionTable
        
        let starting = start[indexPath.row]
        let stopping = stop[indexPath.row]
        
        cell.startTimeLabel.text = "Start: " + starting
        cell.endTimeLabel.text = "Stop: " + stopping
        cell.usernameLabel.text = self.name
        cell.indexLabel.text = String(indexPath.row + 1)

        return cell
    }
}
