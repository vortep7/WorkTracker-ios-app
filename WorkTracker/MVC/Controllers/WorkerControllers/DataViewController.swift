//
//  DataViewController.swift
//  WorkTracker
//
//  Created by Андрей Петров on 07.04.2024.
//

import UIKit

class DataWorkerController: UIViewController {
    var dataWorkerCoordinator: Coordinator!
    var authView: DataWorkerView {return self.view as! DataWorkerView}

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    init(dataWorkerCoordinator: Coordinator) {
        self.dataWorkerCoordinator = dataWorkerCoordinator
        super.init(nibName: nil, bundle: Bundle.main)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = DataWorkerView(frame: UIScreen.main.bounds)
    }
    
    init() {
        self.dataWorkerCoordinator = nil
        super.init(nibName: nil, bundle: Bundle.main)
    }
    
}
