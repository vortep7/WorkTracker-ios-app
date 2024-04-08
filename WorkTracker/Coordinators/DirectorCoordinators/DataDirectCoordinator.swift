//
//  DataDirectCoordinator.swift
//  WorkTracker
//
//  Created by Андрей Петров on 07.04.2024.
//

import Foundation
import UIKit

class DataDirectCoordinator:RootCoordinator {

    
    private var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let mainWorkerVC = DirectorContainer()
        navigationController.pushViewController(mainWorkerVC, animated: true)
    }
}
