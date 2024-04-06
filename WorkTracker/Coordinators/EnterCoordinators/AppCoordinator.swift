//
//  AppCoordinator.swift
//  WorkTracker
//
//  Created by Андрей Петров on 06.04.2024.
//
import UIKit
import Foundation

class AppCoordinator:RootCoordinator {
    
    private var window: UIWindow
    private var navigationController = {
        let navController = UINavigationController()
        return navController
    }()
    
    init(window: UIWindow) {
        self.window = window
        self.window.rootViewController = navigationController
        self.window.makeKeyAndVisible()
    }
    
    func startAuth() {
        let authCoordinator = AuthCoordinator(navigationController: navigationController)
        add(for: authCoordinator)
        authCoordinator.start()
    }
    
    func startWorker() {
        let mainWorkerCoord = MainWorkerCoordinator(navigationController: navigationController)
        add(for: mainWorkerCoord)
        mainWorkerCoord.start()
    }
    
    func startDirector() {
        let mainDirectorCoord = MainDirectorCoordinator(navigationController: navigationController)
        add(for: mainDirectorCoord)
        mainDirectorCoord.start()
    }
}
