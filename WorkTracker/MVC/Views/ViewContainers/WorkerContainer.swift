//
//  FirstContainer.swift
//  WorkTracker
//
//  Created by Андрей Петров on 07.04.2024.
//

import UIKit

class WorkerTabBarController: UITabBarController {
    let bluetoothScanner = BluetoothScanner()

    override func viewDidLoad() {
        self.view.backgroundColor = .red
        
        generateTabBar()
        setTabBarAppearance()
        bluetoothScanner.startScanning()
    }
    
    private func generateTabBar() {
        viewControllers = [
            generateVC(viewController: HoursWorkerController(), title: "Static", image: UIImage(systemName: "dollarsign.circle")),
            generateVC(viewController: ListWorkerController(), title: "Tasks", image: UIImage(systemName: "checkmark.square.fill")),
            generateVC(viewController: MLWorkerController(), title: "Analytic", image: UIImage(systemName: "network")),
            generateVC(viewController: DataWorkerController(), title: "Person", image: UIImage(systemName: "person.circle.fill")),
        ]
    }
    
    private func generateVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
    
    private func setTabBarAppearance() {
        let positionOnX: CGFloat = 14
        let positionOnY: CGFloat = 14
        let width = tabBar.bounds.width - positionOnX * 2
        let height = tabBar.bounds.height + positionOnY * 2
        
        let roundLayer = CAShapeLayer()
        let bezierPath = UIBezierPath(roundedRect: CGRect(x: positionOnX, y: tabBar.bounds.minY - positionOnY, width: width, height: height), cornerRadius: height / 2)
        
        roundLayer.path = bezierPath.cgPath
        roundLayer.backgroundColor = UIColor.white.cgColor
        
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        
        tabBar.itemWidth = width / 5
        tabBar.itemPositioning = .centered
        
        roundLayer.fillColor = UIColor.white.cgColor
        tabBar.tintColor = UIColor.tabBarItemAccent
        tabBar.unselectedItemTintColor = UIColor.tabBarItemLight
    }

}
