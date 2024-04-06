//
//  AuthDirController.swift
//  WorkTracker
//
//  Created by Андрей Петров on 06.04.2024.
//
import Firebase
import UIKit

class AuthDirController: UIViewController {
    var authDirCoordinator: Coordinator
    var authWorkerView: AuthDirView {return self.view as! AuthDirView}
    let managerOfNumber = NumberManager.shared
    var verificationID: String?


    override func viewDidLoad() {
        super.viewDidLoad()
        authWorkerView.onNumberAction = {[weak self] in self?.actionFirst()}
        
        authWorkerView.textField.delegate = self
    }
    
    override func loadView() {
        self.view = AuthDirView(frame: UIScreen.main.bounds)
    }

    init(authDirCoordinator: Coordinator) {
        self.authDirCoordinator = authDirCoordinator
        super.init(nibName: nil, bundle: Bundle.main)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AuthDirController {
    @objc func actionFirst() {
        if managerOfNumber.isValidPhoneNumber(authWorkerView.textField.text!) {
            print(self.authWorkerView.textField.text!)
            PhoneAuthProvider.provider().verifyPhoneNumber(self.authWorkerView.textField.text!, uiDelegate: nil) { verificationID, error in
                if let error = error {
                    print(error)
                } else if let verificationID = verificationID {
                    print("Verification ID:")
                    self.verificationID = verificationID
                    self.present(DirectorCodeController(verificationID: verificationID), animated: true)
                }
            }
        } else {
            print("Invalid phone number")
        }
    }
}

extension AuthDirController: UITextFieldDelegate {
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
