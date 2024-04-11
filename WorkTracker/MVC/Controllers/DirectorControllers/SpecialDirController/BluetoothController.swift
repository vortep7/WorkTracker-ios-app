//
//  BluetoothController.swift
//  WorkTracker
//
//  Created by Андрей Петров on 09.04.2024.
//

import UIKit

class BluetoothController: UIViewController {
    var authView: BluetoothView { return self.view as! BluetoothView }
    var bluetooth = BluetoothScanner()

    override func viewDidLoad() {
        super.viewDidLoad()
        authView.onConnectAction = {[weak self] in self?.actionForAdd()}
        authView.onDeleteAction = {[weak self] in self?.deleteLast()}
        
        authView.tableView.dataSource = self
        authView.tableView.delegate = self
        authView.networkNameTextField.delegate = self
        
        authView.tableView.register(BluetoothTable.self, forCellReuseIdentifier: "\(BluetoothTable.self)")
    }
    
    override func loadView() {
        self.view = BluetoothView(frame: UIScreen.main.bounds)
    }

}

extension BluetoothController:UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        authView.networkNameTextField.resignFirstResponder()
        return true
    }
}

extension BluetoothController {
    @objc func actionForAdd() {
        BluetoothScanner.requiredDevices.append(authView.networkNameTextField.text!)
        UserDefaults.standard.set(BluetoothScanner.requiredDevices, forKey: "director")
        print(BluetoothScanner.requiredDevices)
        authView.networkNameTextField.text = ""
        
        authView.tableView.reloadData()
    }
    
    @objc func deleteLast() {
        if !BluetoothScanner.requiredDevices.isEmpty {
            BluetoothScanner.requiredDevices.removeLast()
            UserDefaults.standard.set(BluetoothScanner.requiredDevices, forKey: "director")
            print(BluetoothScanner.requiredDevices)
            authView.networkNameTextField.text = ""
            
            authView.tableView.reloadData()

        }
    }
}


extension BluetoothController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}

extension BluetoothController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return BluetoothScanner.requiredDevices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(BluetoothTable.self)", for: indexPath) as! BluetoothTable
        
        let net = BluetoothScanner.requiredDevices[indexPath.row]
        cell.reason.text = net
        print(BluetoothScanner.requiredDevices)
        
        cell.backgroundColor = .pickerLabel
        
        return cell
    }
}

