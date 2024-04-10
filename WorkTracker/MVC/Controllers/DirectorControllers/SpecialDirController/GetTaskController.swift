//
//  GetTaskController.swift
//  WorkTracker
//
//  Created by Андрей Петров on 09.04.2024.
//

import UIKit

class GetTaskController: UIViewController {
    var authView: GetTasksView {return self.view as! GetTasksView}
    let source = CoreDataManager.shared.fetchAllReport()
    var muArray:[MyNewUser] = []
    var fastView: newViewForText?
    var currentName: String = ""

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
                muArray.append(element)
            }
        }
    }
}


extension GetTaskController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = muArray[indexPath.row]
        showPopup(for: user)
        tableView.deselectRow(at: indexPath, animated: true)
        currentName = muArray[indexPath.row].uid!
    }
}

extension GetTaskController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return muArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(GetTaskTable.self)", for: indexPath) as! GetTaskTable
        
        let user = muArray[indexPath.row]
        cell.reason.text = "ФИО: " + user.name!
        return cell
    }
}


extension GetTaskController {
    func showPopup(for user: MyNewUser) {
        fastView = newViewForText(frame: UIScreen.main.bounds)
        fastView?.titleLabel.text = "Введите текст"
        fastView?.confirmButton.setTitle("Сохранить", for: .normal)
        
        fastView?.confirmAction = { [weak self] text in
            
            print(text)
            
            var textArray = UserDefaults.standard.array(forKey: self!.currentName.dropFirst() + "_Pop") as? [String] ?? []
            textArray.append(text)
            UserDefaults.standard.set(textArray, forKey: self!.currentName.dropFirst() + "_Pop")
            self?.fastView?.textField.text = ""
            self?.fastView?.removeFromSuperview()
            self?.fastView = nil
        }
        view.addSubview(fastView!)
    }
}
