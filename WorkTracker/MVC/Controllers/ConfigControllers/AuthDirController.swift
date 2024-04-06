//
//  AuthDirController.swift
//  WorkTracker
//
//  Created by Андрей Петров on 06.04.2024.
//

import UIKit

class AuthDirController: UIViewController {
    var authDirCoordinator: Coordinator

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func loadView() {
        self.view = AuthDirView(frame: UIScreen.main.bounds)
    }

    init(authDirCoordinator: Coordinator) {
        self.authDirCoordinator = authDirCoordinator
        super.init(nibName: nil, bundle: Bundle.main)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
