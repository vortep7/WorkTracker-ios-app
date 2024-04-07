//
//  AuthWorkerController.swift
//  WorkTracker
//
//  Created by Андрей Петров on 06.04.2024.
//
import Firebase
import UIKit

class AuthWorkController: UIViewController {
    var authWorkCoordinator: AuthWorkProtocol
    var authWorkerView: AuthWorkerView {return self.view as! AuthWorkerView}
    
    var signup : Bool = true {
        willSet {
            if newValue {
                authWorkerView.changeText(!signup)
                authWorkerView.changeTextForButton(!signup)
            } else {
                authWorkerView.changeText(!signup)
                authWorkerView.changeTextForButton(!signup)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        authWorkerView.onNumberAction = {[weak self] in self?.firstButtonAction()}
        authWorkerView.onResultAction = {[weak self] in self?.secondButtonAction()}

        authWorkerView.textFieldEmail.delegate = self
        authWorkerView.textFieldPassword.delegate = self
    }
    
    override func loadView() {
        self.view = AuthWorkerView(frame: UIScreen.main.bounds)
    }

    init(authWorkCoordinator: AuthWorkProtocol) {
        self.authWorkCoordinator = authWorkCoordinator
        super.init(nibName: nil, bundle: Bundle.main)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AuthWorkController {
    @objc func firstButtonAction() {
        signup = !signup
        print(signup)
    }
    
    @objc func secondButtonAction() {
        let email = "worker" + authWorkerView.textFieldEmail.text! 
        let password = authWorkerView.textFieldPassword.text!
        
        if (signup) {
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if let _ = error {
                    print("не могу его создать работник ")
                } else {
                    self.authWorkCoordinator.runMainWork()
                }
            }
        } else {
            Auth.auth().signIn(withEmail:email, password: password) { result, error in
                if let _ = error {
                    print("не могу его  найти работник ")
                } else {
                    self.authWorkCoordinator.runMainWork()
                }
            }
        }
    }
    
}


extension AuthWorkController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        authWorkerView.textFieldEmail.resignFirstResponder()
        authWorkerView.textFieldPassword.resignFirstResponder()
        return true
    }
}
