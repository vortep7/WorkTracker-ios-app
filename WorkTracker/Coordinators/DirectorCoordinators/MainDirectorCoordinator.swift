//
//  MainDirectorCoordinator.swift
//  WorkTracker
//
//  Created by Андрей Петров on 06.04.2024.
//
import UIKit
import Foundation

class MainDirectorCoordinator:RootCoordinator {
    
    private var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let mainDirVC = MainDirectorController(mainDirectorCoordinator: self)
        navigationController.pushViewController(mainDirVC, animated: true)
    }
}

extension MainDirectorCoordinator:MainDirCoordProtocol {
    func goNext() {
        let authCoordinator = DataDirectCoordinator(navigationController: navigationController)
        add(for: authCoordinator)
        authCoordinator.start()
    }
}
