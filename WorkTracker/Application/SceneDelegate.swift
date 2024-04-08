//
//  SceneDelegate.swift
//  WorkTracker
//
//  Created by Андрей Петров on 06.04.2024.
//
import Firebase
import UIKit
import CoreData

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appCoordinator:AppCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
      

        Auth.auth().addStateDidChangeListener { (auth, user) in
            if let currentUser = user {
                if let email = currentUser.email {
                    if email.contains("worker") {
                        self.appCoordinator = AppCoordinator(window: self.window!)
                        self.appCoordinator!.startWorker()
                    } else if email.contains("director") {
                        self.appCoordinator = AppCoordinator(window: self.window!)
                        self.appCoordinator!.startDirector()
                    }
                }
            } else {
                self.appCoordinator = AppCoordinator(window: self.window!)
                self.appCoordinator!.startAuth()
            }
        }

    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }


}

