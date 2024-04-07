//
//  MainWorkerController.swift
//  WorkTracker
//
//  Created by Андрей Петров on 06.04.2024.
//
import Firebase
import UIKit

class MainWorkerController: UIViewController {
    var mainWorkerCoordinator: Coordinator
    var authView: MainWorkerView {return self.view as! MainWorkerView}

    init(mainWorkerCoordinator: Coordinator) {
        self.mainWorkerCoordinator = mainWorkerCoordinator
        super.init(nibName: nil, bundle: Bundle.main)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        authView.onNumberAction = {[weak self] in self?.dele()}
    }
    
    override func loadView() {
        self.view = MainWorkerView(frame: UIScreen.main.bounds)
    }
    
}

extension MainWorkerController {
    @objc func dele() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("error")
        }
    }
}
