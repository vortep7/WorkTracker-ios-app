//
//  AuthDirController.swift
//  WorkTracker
//
//  Created by Андрей Петров on 06.04.2024.
//
import Firebase
import UIKit

class AuthDirController: UIViewController {
    var authDirCoordinator: AuthDirProtocol
    var authDirView: AuthDirView {return self.view as! AuthDirView}
    
    var signup : Bool = true {
        willSet {
            if newValue {
                authDirView.changeText(!signup)
                authDirView.changeTextForButton(!signup)
            } else {
                authDirView.changeText(!signup)
                authDirView.changeTextForButton(!signup)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        authDirView.onNumberAction = {[weak self] in self?.firstButtonAction()}
        authDirView.onResultAction = {[weak self] in self?.secondButtonAction()}

        authDirView.textFieldEmail.delegate = self
        authDirView.textFieldPassword.delegate = self
    }
    
    override func loadView() {
        self.view = AuthDirView(frame: UIScreen.main.bounds)
    }

    init(authDirCoordinator: AuthDirProtocol) {
        self.authDirCoordinator = authDirCoordinator
        super.init(nibName: nil, bundle: Bundle.main)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AuthDirController {
    @objc func firstButtonAction() {
        signup = !signup
    }
    
    @objc func secondButtonAction() {
        let email = "director" + authDirView.textFieldEmail.text!
        let password = authDirView.textFieldPassword.text!
        
        if (signup) {
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if let _ = error {
                    print("не могу его создать директор ")
                } else {
                    self.authDirCoordinator.runMainDir()
                }
            }
        } else {
            Auth.auth().signIn(withEmail:email, password: password) { result, error in
                if let _ = error {
                    print("не могу его найти директор ")
                } else {
                    self.authDirCoordinator.runMainDir()
                }
            }
        }
    }
    
}


extension AuthDirController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        authDirView.textFieldEmail.resignFirstResponder()
        authDirView.textFieldPassword.resignFirstResponder()
        return true
    }
}
