//
//  HoursWorkerController.swift
//  WorkTracker
//
//  Created by Андрей Петров on 07.04.2024.
//

import UIKit

class HoursWorkerController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func loadView() {
        self.view = HoursWorkerView(frame: UIScreen.main.bounds)
    }
}
