//
//  AuthManager.swift
//  WorkTracker
//
//  Created by Андрей Петров on 06.04.2024.
//
import Firebase
import Foundation


class AuthManager {
    static let shared = AuthManager()
    private init() {}
    var state: Bool = true {
        didSet {
            stateDidChange?(state)
        }
    }
    
    
    var userUID: String?
    var stateDidChange: ((Bool) -> Void)?
    
    func createUser(_ email:String,_ password: String) {
        if (!email.isEmpty && !password.isEmpty) {
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if let _ = error {
                    print("error")
                    self.state = false

                } else {
                    self.state = true

                }
            }
        } else {
            self.state = false
        }
    }
    
    func checkUser(_ email:String, _ password: String) {
        if !email.isEmpty && !password.isEmpty {
            Auth.auth().signIn(withEmail: email, password: password) { result, error in
                if let _ = error {
                    print("error")
                    self.state = false
                } else {
                    self.state = true
                }
            }
        } else {
            self.state = false
        }
    }
    
}
