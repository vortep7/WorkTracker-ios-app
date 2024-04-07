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
    var authDirController: AuthDirController?
    var number: String?

    init(verificationID: String, number: String) {
        self.verificationID = verificationID
        self.number = number
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
                print("penis")
            } else {
                var t = self.number! + "@director.com"
                print(t)
                AuthManager.shared.createUser(self.number! + "@director", "1111111")
            }
        }
    }
}


extension DirectorCodeController: UITextFieldDelegate {
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

extension DirectorCodeController {
    @objc func actionFirst() {
        let code = authWorkerView.textField.text!
        print(code)
        verifyCode(code)
    }
    
    func signInSuccess() {
        UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
    }
}
