//
//  AuthDirectorCoord.swift
//  WorkTracker
//
//  Created by Андрей Петров on 06.04.2024.
//
import UIKit
import Foundation

class AuthDirectorCoord: RootCoordinator {
    
    private var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let authVC = AuthDirController(authDirCoordinator: self)
        navigationController.pushViewController(authVC, animated: true)
    }
}

extension AuthDirectorCoord:AuthDirProtocol {
    func runMainDir() {
        let authCoordinator = MainDirectorCoordinator(navigationController: navigationController)
        add(for: authCoordinator)
        authCoordinator.start()
    }
    
}
