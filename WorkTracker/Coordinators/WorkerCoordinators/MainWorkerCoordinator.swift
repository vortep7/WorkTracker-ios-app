//
//  MainWorkerCoordinator.swift
//  WorkTracker
//
//  Created by Андрей Петров on 06.04.2024.
//
import UIKit
import Foundation

class MainWorkerCoordinator:RootCoordinator {
    
    private var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let mainWorkerVC = MainWorkerController(mainWorkerCoordinator: self)
        navigationController.pushViewController(mainWorkerVC, animated: true)
    }
}
