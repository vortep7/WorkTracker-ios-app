//
//  InfoWorkerController.swift
//  WorkTracker
//
//  Created by Андрей Петров on 08.04.2024.
//

import UIKit
import Firebase
class InfoWorkerController: UIViewController {
    var authView: InfoWorkerView {return self.view as! InfoWorkerView}
    let source = DirectorsArray().array
    var currentValues = Set(UserDefaults.standard.array(forKey: Auth.auth().currentUser!.uid) as? [String] ?? [])
    var myArray:[String] = []
    var defaultArray:[String] = ["None"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        authView.tableView.delegate = self
        authView.tableView.dataSource = self
        authView.tableView.register(InfoDirectorTable.self, forCellReuseIdentifier: "\(InfoDirectorTable.self)")
        
    }
    
    
    override func loadView() {
        self.view = InfoWorkerView(frame: UIScreen.main.bounds)
        
        for element in currentValues {
            myArray.append(element)
        }
        
        print(myArray)
    }
    
}

extension InfoWorkerController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}

extension InfoWorkerController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if myArray.count > 0 {
            return myArray.count
        } else {
            return defaultArray.count
        }
    }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(InfoDirectorTable.self)", for: indexPath) as! InfoDirectorTable
        print(self.myArray.count)
        
        cell.backgroundColor = .white
        
        if myArray.count > 0 {
            let uid = myArray[indexPath.row]
            
            do {
                let userName = try CoreDataManager.shared.newRequest(for: uid)
                for element in userName {
                    cell.reason.text = "ФИО: " + element.name!
                    cell.date.text = "Почта: " + element.email!
                    cell.kind.text = "Информация: " + element.info!                }
            } catch {
                print("error")
            }
                    
            return cell
        } else {
            let uid = defaultArray[indexPath.row]
            
            do {
                let userName = try CoreDataManager.shared.newRequest(for: uid)
                for element in userName {
                    cell.reason.text = "ФИО: " + element.name!
                    cell.date.text = "Почта: " + element.email!
                    cell.kind.text = "Информация: " + element.info!
                }
            } catch {
                print("error")
            }
                    
            return cell
        }
         
    }
    
}

