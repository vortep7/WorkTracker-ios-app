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
        let mainDirVC = MainWorkerController(mainWorkerCoordinator: self)
        navigationController.pushViewController(mainDirVC, animated: true)
    }
}

extension MainWorkerCoordinator:MainWorkCoordProtocol {
    func goNext() {
        let authCoordinator = DataWorkCoord(navigationController: navigationController)
        add(for: authCoordinator)
        authCoordinator.start()
    }
}
