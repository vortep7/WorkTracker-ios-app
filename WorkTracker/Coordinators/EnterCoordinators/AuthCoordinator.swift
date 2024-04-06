//
//  AuthCoordinator.swift
//  WorkTracker
//
//  Created by Андрей Петров on 06.04.2024.
//
import UIKit
import Foundation

class AuthCoordinator: RootCoordinator {
    
    private var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let authVC = AuthViewController(authCoordinator: self)
        navigationController.pushViewController(authVC, animated: true)
    }
}

extension AuthCoordinator: AuthCoordinatorProtocol{
    func runWorkerController() {
        print("run work")
    }
    
    func runDirectorController() {
        print("run dir")
    }

}
