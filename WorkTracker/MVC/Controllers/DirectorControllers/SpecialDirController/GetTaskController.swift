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
    var popupView: PopupView?

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
                print(element.info)
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
        print(indexPath.row)
    }
}

extension GetTaskController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return muArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(GetTaskTable.self)", for: indexPath) as! GetTaskTable
        
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


extension GetTaskController {
    func showPopup(for user: MyNewUser) {
        popupView = PopupView(frame: UIScreen.main.bounds)
        popupView?.titleLabel.text = "Введите текст"
        popupView?.confirmButton.setTitle("Сохранить", for: .normal)
        popupView?.confirmAction = { [weak self] text in
        print("Entered text: \(text)")
        self?.popupView?.removeFromSuperview()
        self?.popupView = nil
    }
        view.addSubview(popupView!)
    }
}
