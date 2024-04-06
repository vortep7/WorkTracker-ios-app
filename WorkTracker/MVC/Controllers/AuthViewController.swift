//
//  ViewController.swift
//  WorkTracker
//
//  Created by Андрей Петров on 06.04.2024.
//

import UIKit

class AuthViewController: UIViewController {
    
    var authCoordinator: Coordinator

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .blue
    }
    
    init(authCoordinator: Coordinator) {
        self.authCoordinator = authCoordinator
        super.init(nibName: nil, bundle: Bundle.main)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

