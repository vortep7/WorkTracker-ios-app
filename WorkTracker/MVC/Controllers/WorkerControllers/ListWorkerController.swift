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

    
    let popArray = UserDefaults.standard.array(forKey: Auth.auth().currentUser!.uid.dropFirst() + "_Pop") as? [String]
    
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

extension ListWorkerController {
    func saveCellState(at index: Int, isCompleted: Bool) {
        UserDefaults.standard.set(isCompleted, forKey: "cell\(index)")
    }
    
    func loadCellState(at index: Int) -> Bool {
        return UserDefaults.standard.bool(forKey: "cell\(index)")
    }
}

extension ListWorkerController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! WorkerCollectionViewCell
        
        let user = popArray?[indexPath.row] ?? "none"
        cell.kind.text = "Задание невыполнено"
        cell.reason.text = user
        cell.backgroundColor = .green
        
        saveCellState(at: indexPath.row, isCompleted: true)
    }
}

extension ListWorkerController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return popArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(WorkerCollectionViewCell.self)", for: indexPath) as! WorkerCollectionViewCell
        
        let isCompleted = loadCellState(at: indexPath.row)
        if isCompleted {
            let user = popArray?[indexPath.row] ?? "none"
            cell.reason.text = user
            cell.kind.text = "Задание выполнено"
            cell.backgroundColor = .green
        } else {
            let user = popArray?[indexPath.row] ?? "none"
            cell.reason.text = user
            cell.kind.text = "Задание невыполнено"
            cell.backgroundColor = .red
        }
        
        return cell
    }
}

