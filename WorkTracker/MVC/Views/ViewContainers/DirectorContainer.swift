//
//  DirectorContainer.swift
//  WorkTracker
//
//  Created by Андрей Петров on 08.04.2024.
//
import UIKit
import Foundation

class DirectorContainer: UITabBarController {
    let bluetoothScanner = BluetoothScanner()

    override func viewDidLoad() {
        self.view.backgroundColor = .red
        
        generateTabBar()
        setTabBarAppearance()
        bluetoothScanner.startScanning()
    }
    
    private func generateTabBar() {
        viewControllers = [
            generateVC(viewController: HoursDirectorController(), title: "Static", image: UIImage(systemName: "dollarsign.circle")),
            generateVC(viewController: ListDirectorController(), title: "Tasks", image: UIImage(systemName: "checkmark.square.fill")),
            generateVC(viewController: MLDirectorController(), title: "Analytic", image: UIImage(systemName: "network")),
            generateVC(viewController: DataDirController(), title: "Person", image: UIImage(systemName: "person.circle.fill")),
        ]
    }
    
    private func generateVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
    
    private func setTabBarAppearance() {
            let positionOnX: CGFloat = 10
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
            
            roundLayer.fillColor = UIColor.systemPink.cgColor
            tabBar.tintColor = UIColor.white
            tabBar.unselectedItemTintColor = UIColor.yellow
        }
}
