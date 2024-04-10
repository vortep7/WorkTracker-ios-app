//
//  ListDirectorController.swift
//  WorkTracker
//
//  Created by Андрей Петров on 08.04.2024.
//

import Firebase
import UIKit

class ListDirectorController: UIViewController {
    var authView: ListDirectorView { return self.view as! ListDirectorView }
    var uid: String?
    var kind: String?
    var savedTasks = UserDefaults.standard.array(forKey: Auth.auth().currentUser!.uid.dropFirst() + "_Mytasks") as? [String] ?? ["none"]
    
    override func viewDidLoad() {
        
        authView.tableView.dataSource = self
        authView.tableView.delegate = self
        
        authView.tableView.register(WorkerCollectionViewCell.self, forCellReuseIdentifier: "\(WorkerCollectionViewCell.self)")
        authView.onPersonButton = {[weak self] in self?.actionForPerson()}
        authView.onMyTask = {[weak self] in self?.myTaskAction()}
        authView.onReloadData = {[weak self] in self?.reloadAction()}
    }
    
    override func loadView() {
        self.view = ListDirectorView(frame: UIScreen.main.bounds)
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }
}

//MARK: - table delegate/data source
extension ListDirectorController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}

extension ListDirectorController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedTasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(WorkerCollectionViewCell.self)", for: indexPath) as! WorkerCollectionViewCell
        cell.reason.text = savedTasks[indexPath.row]
        return cell
    }
}

extension ListDirectorController {
    @objc func actionForPerson() {
        let nextController = GetTaskController()
        present(nextController, animated: true)
    }
    
    @objc func myTaskAction() {
        let nextController = AddMyTaskController()
        present(nextController, animated: true)
    }
    
    @objc func reloadAction() {
        savedTasks = UserDefaults.standard.array(forKey: Auth.auth().currentUser!.uid.dropFirst() + "_Mytasks") as? [String] ?? ["none"]
        authView.tableView.reloadData()
    }

}
