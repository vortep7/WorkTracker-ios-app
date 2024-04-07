//
//  ListWorkerController.swift
//  WorkTracker
//
//  Created by Андрей Петров on 07.04.2024.
//

import UIKit

class ListWorkerController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func loadView() {
        self.view = ListWorkerView(frame: UIScreen.main.bounds)
    }
}
