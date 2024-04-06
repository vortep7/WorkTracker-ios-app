//
//  DirectorCodeView.swift
//  WorkTracker
//
//  Created by Андрей Петров on 06.04.2024.
//

import UIKit

class DirectorCodeController: UIViewController {
    
    var authWorkerView: WorkerCodeView {return self.view as! WorkerCodeView}

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func loadView() {
        self.view = WorkerCodeView(frame: UIScreen.main.bounds)
    }

}
