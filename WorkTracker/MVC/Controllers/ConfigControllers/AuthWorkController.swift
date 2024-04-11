//
//  AuthWorkerController.swift
//  WorkTracker
//
//  Created by Андрей Петров on 06.04.2024.
//
import Firebase
import UIKit
import WebKit

class AuthWorkController: UIViewController, WKNavigationDelegate {
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
        
        authWorkerView.onVkAction = {[weak self] in self?.vkAction()}
        authWorkerView.onGoogleAction = {[weak self] in self?.googleAction()}
        authWorkerView.onTgAction = {[weak self] in self?.tgction()}
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
    
    @objc func vkAction() {
        signup = !signup
        openMessengerURL(urlString: "https://vk.com/vortep7")
    }
    
    @objc func googleAction() {
        signup = !signup
        openMessengerURL(urlString: "https://github.com/vortep7/WorkTracker-ios-app")
    }
    
    @objc func tgction() {
        signup = !signup
        openMessengerURL(urlString: "https://telegram.org")
    }
    
    private func openMessengerURL(urlString: String) {
        if let url = URL(string: urlString) {
            let webView = WKWebView(frame: UIScreen.main.bounds)
            webView.navigationDelegate = self
            view.addSubview(webView)
            webView.load(URLRequest(url: url))
        }
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
