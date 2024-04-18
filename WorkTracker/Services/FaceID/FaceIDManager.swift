//
//  FaceIDManager.swift
//  WorkTracker
//
//  Created by Андрей Петров on 18.04.2024.
//
import LocalAuthentication
import Foundation

class FaceIDManager {
    
    func faceID() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            
            let reason = "Вход по Face ID"
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason, reply: { [weak self] success, error in
                if success {
                    DispatchQueue.main.async {
                        print("Успешная авторизация")
                    }
                } else {
                    if let error = error as NSError? {
                        DispatchQueue.main.async {
                            switch error.code {
                            case LAError.userFallback.rawValue:
                                print("Пользователь выбрал ввод пароля")
                            default:
                                print("Ошибка авторизации по Face ID: \(error.localizedDescription)")
                            }
                        }
                    }
                }
            })
            
        } else {
            print("Face ID недоступен")
        }
    }
    
}

protocol FaceIDProtocol {
    func faceID()
}
