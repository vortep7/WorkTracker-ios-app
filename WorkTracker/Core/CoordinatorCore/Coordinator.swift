//
//  Coordinator.swift
//  WorkTracker
//
//  Created by Андрей Петров on 06.04.2024.
//

import Foundation

//MARK: - root protocol for coordinators
protocol Coordinator: AnyObject {
    var childCoordinator:[Coordinator] {get set}
    func start()
}

//MARK: - base func for all coordinators
extension Coordinator {
    func add(for coordinator: Coordinator) {
        childCoordinator.append(coordinator)
    }
}
