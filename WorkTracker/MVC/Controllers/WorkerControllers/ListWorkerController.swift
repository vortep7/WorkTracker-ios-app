//
//  ListWorkerController.swift
//  WorkTracker
//
//  Created by Андрей Петров on 07.04.2024.
//
import Firebase
import UIKit

class ListWorkerController: UIViewController {
    
    var statisticView: ListWorkerView { return self.view as! ListWorkerView}
    var uid: String?
    var kind: String?

    
    override func viewDidLoad() {
        
        statisticView.tableView.dataSource = self
        statisticView.tableView.delegate = self
        
        statisticView.tableView.register(WorkerCollectionViewCell.self, forCellReuseIdentifier: "\(WorkerCollectionViewCell.self)")
    }
    
    override func loadView() {
        self.view = ListWorkerView(frame: UIScreen.main.bounds)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
}

//MARK: - table delegate/data source
extension ListWorkerController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}

extension ListWorkerController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(WorkerCollectionViewCell.self)", for: indexPath) as! WorkerCollectionViewCell
        
        
        return cell
    }
}
