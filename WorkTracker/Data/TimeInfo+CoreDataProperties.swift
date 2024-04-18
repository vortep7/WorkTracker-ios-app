//
//  TimeInfo+CoreDataProperties.swift
//  WorkTracker
//
//  Created by Андрей Петров on 18.04.2024.
//
//

import Foundation
import CoreData

@objc(TimeInfo)
public class TimeInfo: NSManagedObject {

}


extension TimeInfo{

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TimeInfo> {
        return NSFetchRequest<TimeInfo>(entityName: "TimeInfo")
    }

    @NSManaged public var firstTime: String?
    @NSManaged public var secondTime: String?
    @NSManaged public var fullTime: String?

}

extension TimeInfo: Identifiable {
    
}
