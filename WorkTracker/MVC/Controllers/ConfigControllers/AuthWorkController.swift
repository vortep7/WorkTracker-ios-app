//
//  AuthWorkerController.swift
//  WorkTracker
//
//  Created by Андрей Петров on 06.04.2024.
//
import UIKit
import UIKit

class AuthWorkerController: UIViewController {
    
    var authWorkerCoordinator: Coordinator
    var authWorkerView: AuthWorkerView {return self.view as! AuthWorkerView}
    let managerOfNumber = NumberManager.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        
        authWorkerView.onNumberAction = {[weak self] in self?.actionFirst()}
        authWorkerView.textField.delegate = self
    }
    
    override func loadView() {
        self.view = AuthWorkerView(frame: UIScreen.main.bounds)
    }
    
    init(authWorkerCoordinator: Coordinator) {
        self.authWorkerCoordinator = authWorkerCoordinator
        super.init(nibName: nil, bundle: Bundle.main)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension AuthWorkerController {
    @objc func actionFirst() {
        if managerOfNumber.isValidPhoneNumber(authWorkerView.textField.text!) {
            present(WorkerCodeController(), animated: true)
        } else {
            print("error")
        }
    }
}

extension AuthWorkerController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        if managerOfNumber.isValidPhoneNumber(authWorkerView.textField.text!) {
            authWorkerView.infoButton.isEnabled = true
            authWorkerView.infoButton.alpha = 1

        } else {
            authWorkerView.infoButton.isEnabled = false
            authWorkerView.infoButton.alpha = 0.4
        }
        
        return true
    }
    
}
