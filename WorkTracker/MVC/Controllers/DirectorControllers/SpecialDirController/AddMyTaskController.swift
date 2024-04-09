//
//  AddMyTaskController.swift
//  WorkTracker
//
//  Created by Андрей Петров on 09.04.2024.
//
import Firebase
import UIKit

class AddMyTaskController: UIViewController {
    var authView: AddMyTaskView { return self.view as! AddMyTaskView }

    override func viewDidLoad() {
        super.viewDidLoad()
        authView.textField.delegate = self
        authView.onNumberAction = { [weak self] in self?.saveMyData()}
    }

    override func loadView() {
        self.view = AddMyTaskView(frame: UIScreen.main.bounds)
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }

}

extension AddMyTaskController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        authView.textField.resignFirstResponder()
        return true
    }
}

extension AddMyTaskController {
    @objc func saveMyData() {
        var savedTasks = UserDefaults.standard.array(forKey: Auth.auth().currentUser!.uid.dropFirst() + "_Mytasks") as? [String] ?? ["none"]
        if let task = authView.textField.text, !task.isEmpty {
            savedTasks.append(task)
            let userKey = Auth.auth().currentUser!.uid
            let str = String(userKey.dropFirst())
            let tasksKey = str + "_Mytasks"
            UserDefaults.standard.set(savedTasks, forKey: tasksKey)
            authView.textField.text = ""
        }
    }
}



