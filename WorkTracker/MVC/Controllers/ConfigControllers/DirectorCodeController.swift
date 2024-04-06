//
//  DirectorCodeView.swift
//  WorkTracker
//
//  Created by Андрей Петров on 06.04.2024.
//
import Firebase
import UIKit

class DirectorCodeController: UIViewController {
    var verificationID: String
    var managerOfCode = CodeManager.shared
    var authWorkerView: DirectorCodeView {return self.view as! DirectorCodeView}
    
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
    
    func verifyCode(_ code: String) {
        let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationID, verificationCode: code)
        Auth.auth().signIn(with: credential) { authResult, error in
            if let error = error {
                print("Error signing in:", error)
            } else {
                print("Successfully signed in")
            }
        }
    }
}


extension DirectorCodeController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
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

extension DirectorCodeController {
    @objc func actionFirst() {
        let code = authWorkerView.textField.text!
        verifyCode(code)
    }
}
