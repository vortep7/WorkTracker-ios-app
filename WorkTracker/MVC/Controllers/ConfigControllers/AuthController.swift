//
//  ViewController.swift
//  WorkTracker
//
//  Created by Андрей Петров on 06.04.2024.
//

import UIKit

class AuthViewController: UIViewController {
    var authCoordinator: AuthCoordinatorProtocol
    var authView: AuthView {return self.view as! AuthView}

    override func viewDidLoad() {
        super.viewDidLoad()
        
        authView.onLogButtonAction = {[weak self] in self?.workerAction()}
        authView.onInfoButtonAction = {[weak self] in self?.directorAction()}
    }
    
    override func loadView() {
        self.view = AuthView(frame: UIScreen.main.bounds)
    }
    
    init(authCoordinator: AuthCoordinatorProtocol) {
        self.authCoordinator = authCoordinator
        super.init(nibName: nil, bundle: Bundle.main)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension AuthViewController {
    @objc func workerAction() {
        authCoordinator.runWorkerController()
    }
    
    @objc func directorAction() {
        authCoordinator.runDirectorController()
    }
}
