//
//  MLDirectorController.swift
//  WorkTracker
//
//  Created by Андрей Петров on 08.04.2024.
//

import UIKit

class MLDirectorController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func loadView() {
        self.view = MLDirectorView(frame: UIScreen.main.bounds)
    }

}
