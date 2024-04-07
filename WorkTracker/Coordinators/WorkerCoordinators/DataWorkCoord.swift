//
//  DataWorkCoord.swift
//  WorkTracker
//
//  Created by Андрей Петров on 07.04.2024.
//
import UIKit
import Foundation

class DataWorkCoord:RootCoordinator {
    
    private var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let mainDirVC = WorkerTabBarController()
        navigationController.pushViewController(mainDirVC, animated: true)
    }
}
