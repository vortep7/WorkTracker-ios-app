//
//  InfoTimeController.swift
//  WorkTracker
//
//  Created by Андрей Петров on 09.04.2024.
//
import UIKit
import Foundation
import Firebase
class InfoTimeController: UIViewController {
    var authView: InfoTimeView {return self.view as! InfoTimeView}
    var source = CoreDataManager.shared.fetchAllReport()
    var muArray:[MyNewUser] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        authView.tableView.dataSource = self
        authView.tableView.delegate = self
        authView.tableView.register(TableTimeForDir.self, forCellReuseIdentifier: "\(TableTimeForDir.self)")
    }
    
    override func loadView() {
        self.view = InfoTimeView(frame: UIScreen.main.bounds)
        for element in source {
            let t = element.info?.contains("работник")
            if t! {
                muArray.append(element)
            }
        }
        
        print(muArray.count)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        authView.tableView.reloadData()
    }
}


extension InfoTimeController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50))
    }
    
    
}


extension InfoTimeController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return muArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(TableTimeForDir.self)", for: indexPath) as! TableTimeForDir
        
        let user = muArray[indexPath.row]

        print(user.uid!.dropFirst() + "_Days")
        print(user.uid!.dropFirst() + "_Full")

        let fullDays = UserDefaults.standard.double(forKey: user.uid!.dropFirst() + "_Days")
        let fullTimes = UserDefaults.standard.double(forKey: user.uid!.dropFirst() + "_Full")

        let roundedFullDays = (fullDays * 10).rounded() / 10
        let roundedFullTimes = (fullTimes * 10).rounded() / 10

        let formattedFullDays = String(format: "%.1f", roundedFullDays)
        let formattedFullTimes = String(format: "%.1f", roundedFullTimes)
        
        cell.reason.text = "ФИО: " + user.name!
        cell.date.text = "Сегодняшний день (от полного): " + formattedFullDays
        cell.amount.text = "Всего дней (в процентах): " + formattedFullTimes

        return cell
    }
}

