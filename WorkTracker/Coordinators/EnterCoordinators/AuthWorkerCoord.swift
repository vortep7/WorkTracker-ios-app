//
//  AuthWorkerCoordinator.swift
//  WorkTracker
//
//  Created by Андрей Петров on 06.04.2024.
//
import UIKit
import Foundation
class AuthWorkerCoord: RootCoordinator {
    
    private var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let authVC = AuthWorkController(authWorkCoordinator: self)
        navigationController.pushViewController(authVC, animated: true)
    }
}

extension AuthWorkerCoord: AuthWorkProtocol{
    func runMainWork() {
        let authCoordinator = MainWorkerCoordinator(navigationController: navigationController)
        add(for: authCoordinator)
        authCoordinator.start()
    }

}
