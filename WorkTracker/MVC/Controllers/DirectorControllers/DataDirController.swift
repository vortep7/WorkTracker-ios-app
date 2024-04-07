//
//  DataDirController.swift
//  WorkTracker
//
//  Created by Андрей Петров on 07.04.2024.
//

import UIKit

class DataDirController: UIViewController {
    var dataDirectorCoordinator: Coordinator

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    init(dataDirectorCoordinator: Coordinator) {
        self.dataDirectorCoordinator = dataDirectorCoordinator
        super.init(nibName: nil, bundle: Bundle.main)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
