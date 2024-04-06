//
//  SceneDelegate.swift
//  WorkTracker
//
//  Created by Андрей Петров on 06.04.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appCoordinator:AppCoordinator?
    var count = 1

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)

        if let window = window {
            
            if self.count == 1 {
                appCoordinator = AppCoordinator(window: window)
                appCoordinator!.startAuth()
            } else if self.count == 2 {
                appCoordinator = AppCoordinator(window: window)
                appCoordinator!.startWorker()
            } else if self.count == 3 {
                appCoordinator = AppCoordinator(window: window)
                appCoordinator!.startDirector()
            }
        }
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }


}

