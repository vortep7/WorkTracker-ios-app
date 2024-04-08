//
//  DataPresentController.swift
//  WorkTracker
//
//  Created by Андрей Петров on 08.04.2024.
//
import Firebase
import UIKit

class DataPresentController: UIViewController {
    var authView: DataPresentView {return self.view as! DataPresentView}
    var DataManager = CoreDataManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        authView.onNextAction = {[weak self] in self?.exit()}
        download()
    }
    
    override func loadView() {
        self.view = DataPresentView(frame: UIScreen.main.bounds)
    }

}

extension DataPresentController {
    func download() {
        do {
            var request = try CoreDataManager.shared.newRequest(for: Auth.auth().currentUser!.uid)
            for i in request {
                
                authView.labelNamed.text = i.name
                authView.labelInfo.text = i.info
                authView.labelEmail.text = i.email
            }
        } catch {
            print("error")
        }
    }
    
    @objc func exit() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("error")
        }
    }
}
