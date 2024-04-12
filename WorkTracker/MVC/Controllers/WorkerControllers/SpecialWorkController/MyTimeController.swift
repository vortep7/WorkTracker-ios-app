//
//  MyTimeController.swift
//  WorkTracker
//
//  Created by Андрей Петров on 12.04.2024.
//
import UIKit
import Foundation
import Firebase

class MyTimeController: UIViewController {
    var source = CoreDataManager.shared.fetchAllReport()
    var muArray:[MyNewUser] = []
    var statisticView: MyTimeView { return self.view as! MyTimeView }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let second = String(UserDefaults.standard.double(forKey: (Auth.auth().currentUser?.uid.dropFirst())! + "_daysTimeStop"))
        statisticView.hoursLabel.text = second + " %"
    }
    
    override func loadView() {
        self.view = MyTimeView(frame: UIScreen.main.bounds)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let second = String(UserDefaults.standard.double(forKey: (Auth.auth().currentUser?.uid.dropFirst())! + "_daysTimeStop"))
        statisticView.hoursLabel.text = second + " %"
    }

}

