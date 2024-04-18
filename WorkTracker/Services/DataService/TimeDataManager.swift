//
//  TimeDataManager.swift
//  WorkTracker
//
//  Created by Андрей Петров on 18.04.2024.
//
import UIKit
import Foundation
import CoreData

class TimeDataManager:TimeManagerDataProtocol {
    
    static let shared = TimeDataManager()
    private init() {}
    
    //create appDelegate
    private var appDelegate: AppDelegate {
        UIApplication.shared.delegate as! AppDelegate
    }
    
    //create context
    private var context: NSManagedObjectContext {
        appDelegate.persistentContainer.viewContext
    }
    
    func createTimeData() {
        let timeDescription = NSEntityDescription.entity(forEntityName: "TimeInfo", in: context)
        let time = TimeInfo(entity: timeDescription!, insertInto: context)
        
        time.firstTime = ""
        time.secondTime = ""
        time.fullTime = ""
    }
    
    func getTimeData() {
        
    }
    
    func deleteTimeData() {
        
    }
}

protocol TimeManagerDataProtocol {
    
}
