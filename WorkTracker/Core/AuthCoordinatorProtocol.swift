//
//  AuthCoordinatorProtocol.swift
//  WorkTracker
//
//  Created by Андрей Петров on 06.04.2024.
//

import Foundation

protocol AuthCoordinatorProtocol: Coordinator {
    func runWorkerController()
    func runDirectorController()
}
