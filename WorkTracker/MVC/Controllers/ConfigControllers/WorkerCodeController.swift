//
//  WorkerCodeController.swift
//  WorkTracker
//
//  Created by Андрей Петров on 06.04.2024.
//

import Firebase
import UIKit

class WorkerCodeController: UIViewController {
    var verificationID: String
    var managerOfCode = CodeManager.shared
    var authWorkerView: DirectorCodeView {return self.view as! DirectorCodeView}
    var authDirController: AuthDirController?

    init(verificationID: String) {
        self.verificationID = verificationID
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = DirectorCodeView(frame: UIScreen.main.bounds)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        authWorkerView.textField.delegate = self
        authWorkerView.onNumberAction = {[weak self] in self?.actionFirst()}
    }
    
}


extension WorkerCodeController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        let bundleIdentifier = Bundle.main.bundleIdentifier

        if self.managerOfCode.isValidPassword(self.authWorkerView.textField.text!) {
            authWorkerView.infoButton.isEnabled = true
            authWorkerView.infoButton.alpha = 1

        } else {
            authWorkerView.infoButton.isEnabled = false
            authWorkerView.infoButton.alpha = 0.4
        }
        
        return true
    }
    
}

extension WorkerCodeController {
    @objc func actionFirst() {
        let code = authWorkerView.textField.text!
        print(code)
        verifyCode(code)
    }
    
    func signInSuccess() {
        UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
    }
}
