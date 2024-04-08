//
//  User+CoreDataProperties.swift
//  WorkTracker
//
//  Created by Андрей Петров on 08.04.2024.
//
//

import Foundation
import CoreData

@objc(User)

public class oi: NSManagedObject {
    
}

extension oi {
    
    @NSManaged public var name: String?
    @NSManaged public var date: String?
    @NSManaged public var mail: String?
    @NSManaged public var info: String?

}
