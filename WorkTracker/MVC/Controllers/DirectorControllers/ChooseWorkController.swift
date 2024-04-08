//
//  ChooseWorkController.swift
//  WorkTracker
//
//  Created by Андрей Петров on 08.04.2024.
//

import UIKit

import Firebase
import UIKit

class ChooseWorkController: UIViewController {
    var authView: ChooseWorkerView {return self.view as! ChooseWorkerView}
    let ref = Database.database().reference()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        authView.onFirst = {[weak self] in self?.firstAction()}
        authView.onSecond = {[weak self] in self?.secondAction()}
        authView.onThird = {[weak self] in self?.thirdAction()}
        authView.onFourth = {[weak self] in self?.fourthAction()}
    }
    
    override func loadView() {
        self.view = ChooseWorkerView(frame: UIScreen.main.bounds)
    }
    
    func realTime(_ key:String) {
        ref.child(key).observe(.value, with: { snapshot in
            let value = snapshot.value as? String
            print(value)
        })
    }

}

extension ChooseWorkController {
    @objc func firstAction() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        var currentValues = Set(UserDefaults.standard.array(forKey: uid) as? [String] ?? [])
        
        ref.child(FireBaseKeys.FirstWorker.rawValue).observe(.value, with: { snapshot in
            let value = snapshot.value as? String
            print(value!)
            currentValues.insert(value!)
            UserDefaults.standard.set(Array(currentValues), forKey: uid)
        })
    }
    
    @objc func secondAction() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        var currentValues = Set(UserDefaults.standard.array(forKey: uid) as? [String] ?? [])
        ref.child(FireBaseKeys.SecondWorker.rawValue).observe(.value, with: { snapshot in
            let value = snapshot.value as? String
            print(value!)
            currentValues.insert(value!)
            UserDefaults.standard.set(Array(currentValues), forKey: uid)
        })
        
    }
    
    @objc func thirdAction() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        var currentValues = Set(UserDefaults.standard.array(forKey: uid) as? [String] ?? [])
        ref.child(FireBaseKeys.ThirdWorker.rawValue).observe(.value, with: { snapshot in
            let value = snapshot.value as? String
            print(value!)
            currentValues.insert(value!)
            UserDefaults.standard.set(Array(currentValues), forKey: uid)
        })
    }
    
    @objc func fourthAction() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        var currentValues = Set(UserDefaults.standard.array(forKey: uid) as? [String] ?? [])
        ref.child(FireBaseKeys.FourthWorker.rawValue).observe(.value, with: { snapshot in
            let value = snapshot.value as? String
            print(value!)
            currentValues.insert(value!)
            UserDefaults.standard.set(Array(currentValues), forKey: uid)
        })
        print(currentValues)
    }
}


enum FireBaseKeys:String {
    case FirstWorker = "FirstWorker"
    case SecondWorker = "SecondWorker"
    case ThirdWorker = "ThirdWorker"
    case FourthWorker = "FourthWorker"
}
