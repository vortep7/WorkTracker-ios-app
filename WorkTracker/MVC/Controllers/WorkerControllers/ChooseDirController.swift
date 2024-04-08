//
//  ChooseDirController.swift
//  WorkTracker
//
//  Created by Андрей Петров on 08.04.2024.
//
import Firebase
import UIKit

class ChooseDirController: UIViewController {
    var authView: ChooseDirView {return self.view as! ChooseDirView}

    override func viewDidLoad() {
        super.viewDidLoad()
        authView.onFirst = {[weak self] in self?.firstAction()}
        authView.onSecond = {[weak self] in self?.secondAction()}
        authView.onThird = {[weak self] in self?.thirdAction()}
        authView.onFourth = {[weak self] in self?.fourthAction()}

    }
    
    override func loadView() {
        self.view = ChooseDirView(frame: UIScreen.main.bounds)
    }

}

extension ChooseDirController {
    @objc func firstAction() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        var currentValues = Set(UserDefaults.standard.array(forKey: uid) as? [String] ?? [])
        currentValues.insert("50Llp4IBtIbnRwDabOPPGPTXkq93")
        UserDefaults.standard.set(Array(currentValues), forKey: uid)
    }
    
    @objc func secondAction() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        var currentValues = Set(UserDefaults.standard.array(forKey: uid) as? [String] ?? [])
        currentValues.insert("NJaVC24gkmXsTFOrDTz7x3fT7Il2")
        UserDefaults.standard.set(Array(currentValues), forKey: uid)
    }
    
    @objc func thirdAction() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        var currentValues = Set(UserDefaults.standard.array(forKey: uid) as? [String] ?? [])
        currentValues.insert("gEA28pYnhGaVeMySAQlyLDrSzul2")
        UserDefaults.standard.set(Array(currentValues), forKey: uid)
    }
    
    @objc func fourthAction() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        var currentValues = Set(UserDefaults.standard.array(forKey: uid) as? [String] ?? [])
        currentValues.insert("50Llp4IBtIbnRwDabOPPGPTXkq93")
        UserDefaults.standard.set(Array(currentValues), forKey: uid)
        print(currentValues)
    }
}
