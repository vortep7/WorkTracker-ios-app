//
//  ListDirectorController.swift
//  WorkTracker
//
//  Created by Андрей Петров on 08.04.2024.
//

import Firebase
import UIKit

class ListDirectorController: UIViewController, UICollectionViewDelegate {
    var authView: ListDirectorView { return self.view as! ListDirectorView }
    var uid: String?
    var kind: String?
    var savedTasks = UserDefaults.standard.array(forKey: Auth.auth().currentUser!.uid.dropFirst() + "_Mytasks") as? [String] ?? ["default_tasks"]
    
    override func viewDidLoad() {
        
        authView.collectionView.dataSource = self
        authView.collectionView.delegate = self
        authView.collectionView.register(DirectorTaskCell.self, forCellWithReuseIdentifier: "\(DirectorTaskCell.self)")
        
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
extension ListDirectorController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(savedTasks.count)
        return savedTasks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(DirectorTaskCell.self)", for: indexPath) as? DirectorTaskCell else {
            print("eror")
            return UICollectionViewCell()
        }
        
        print(savedTasks[indexPath.row])
        cell.layer.cornerRadius = 20
        
        cell.taskImageView.image = UIImage(named: "dirr")
        cell.taskLabel.text = savedTasks[indexPath.row]
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
        authView.collectionView.reloadData()
    }

}

