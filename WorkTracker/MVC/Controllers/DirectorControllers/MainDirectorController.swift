//
//  MainDirectorController.swift
//  WorkTracker
//
//  Created by Андрей Петров on 06.04.2024.
//

import UIKit

class MainDirectorController: UIViewController {

    var mainDirectorCoordinator: Coordinator
    
    init(mainDirectorCoordinator: Coordinator) {
        self.mainDirectorCoordinator = mainDirectorCoordinator
        super.init(nibName: nil, bundle: Bundle.main)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .brown
    }

}
