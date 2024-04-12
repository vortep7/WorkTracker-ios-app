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
                let defaultDate = Date(timeIntervalSinceReferenceDate: 0) 
                authView.nameLabel.text = "Name: " + (i.name ?? " ")
                authView.infoLabel.text = "Info: " + (i.info ?? " ")
                authView.emailLabel.text = "Email: " + (i.email ?? " ")
                authView.dateLabel.text = "Date: \(i.date)"
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
