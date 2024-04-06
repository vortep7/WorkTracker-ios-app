//
//  RootCoordinator.swift
//  WorkTracker
//
//  Created by Андрей Петров on 06.04.2024.
//

import Foundation

class RootCoordinator: Coordinator {
    var childCoordinator: [Coordinator] = []
    
    func start() {
        print("create coordinator")
    }
}
