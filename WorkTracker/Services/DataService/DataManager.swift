//
//  DataManager.swift
//  WorkTracker
//
//  Created by Андрей Петров on 08.04.2024.
//

import Foundation

import UIKit
import CoreData


//CRUD pattern
public class CoreDataManager {
    
    //MARK: - singlton
    static let shared = CoreDataManager()
    private init() {}
    
    private var appDelegate:AppDelegate {
        UIApplication.shared.delegate as! AppDelegate
    }
    
    private var context: NSManagedObjectContext {
        appDelegate.persistentContainer.viewContext
    }
    
    public func createReport(name: String,info : String,email: String,uid: String,date:Date?) throws {
        guard let entityReportDescription = NSEntityDescription.entity(forEntityName: "MyNewUser", in: context)
        else { throw DataErrors.entityCreationFailed}
        
        let report = MyNewUser(entity: entityReportDescription, insertInto: context)
        report.name = name
        report.info = info
        report.email = email
        report.uid = uid
        report.date = date
        appDelegate.saveContext()
    }

    
    public func fetchAllReport() -> [MyNewUser] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "MyNewUser")
        do {
            return (try? context.fetch(fetchRequest) as? [MyNewUser]) ?? []
        }
    }
    
    public func newRequest(for uid: String) throws -> [MyNewUser] {
        let fetchRequest: NSFetchRequest<MyNewUser> = MyNewUser.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "uid == %@", uid)
        
        do {
            guard let reports = try context.fetch(fetchRequest) as? [MyNewUser] else {
                throw DataErrors.invalidFetchRequest
            }
            return reports
        } catch {
            throw error
        }
    }
    
    public func fetchReports(for uid: String) -> [MyNewUser] {
        let fetchRequest: NSFetchRequest<MyNewUser> = MyNewUser.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "uid == %@", uid)
        
        do {
            return try context.fetch(fetchRequest)
        } catch {
            print("Error fetching reports: \(error.localizedDescription)")
            return []
        }
    }
    
    public func deleteAllReport() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "MyNewUser")
        do {
            let reports = try? context.fetch(fetchRequest) as? [MyNewUser]
            reports?.forEach{context.delete($0)}
            
        }
        appDelegate.saveContext()
    }
    
    public func deleteReport(with uid: String) throws{
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "MyNewUser")
        do {
            guard let reports = try? context.fetch(fetchRequest) as? [MyNewUser],
                    let report = reports.first(where: {$0.uid == uid})
            else {throw DataErrors.invalidFetchRequest}
            
            context.delete(report)
        }
        appDelegate.saveContext()
    }

}
