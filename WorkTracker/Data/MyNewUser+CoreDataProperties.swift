//
//  MyNewUser+CoreDataProperties.swift
//  WorkTracker
//
//  Created by Андрей Петров on 08.04.2024.
//
//

import Foundation
import CoreData

@objc(MyNewUser)
public class MyNewUser:NSManagedObject {
    
}
extension MyNewUser {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<MyNewUser> {
        return NSFetchRequest<MyNewUser>(entityName: "MyNewUser")
    }
    
    @NSManaged public var name: String?
    @NSManaged public var email: String?
    @NSManaged public var info: String?
    @NSManaged public var uid: String?
    @NSManaged public var date: Date?
}

extension MyNewUser:Identifiable {
    
}
