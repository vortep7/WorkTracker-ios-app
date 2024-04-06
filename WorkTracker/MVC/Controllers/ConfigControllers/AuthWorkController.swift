//
//  AuthWorkerController.swift
//  WorkTracker
//
//  Created by Андрей Петров on 06.04.2024.
//

import UIKit

class AuthWorkerController: UIViewController {
    
    var authWorkerCoordinator: Coordinator

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func loadView() {
        self.view = AuthWorkerView(frame: UIScreen.main.bounds)
    }
    
    init(authWorkerCoordinator: Coordinator) {
        self.authWorkerCoordinator = authWorkerCoordinator
        super.init(nibName: nil, bundle: Bundle.main)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
