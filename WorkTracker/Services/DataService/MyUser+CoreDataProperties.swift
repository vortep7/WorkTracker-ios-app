//
//  MyUser+CoreDataProperties.swift
//  WorkTracker
//
//  Created by Андрей Петров on 08.04.2024.
//
//

import Foundation
import CoreData

@objc(MyUser)
public class MyUser: NSManagedObject {

}
extension MyUser {


    @NSManaged public var name: NSObject?
    @NSManaged public var email: NSObject?
    @NSManaged public var info: NSObject?
    @NSManaged public var date: NSObject?

}

extension MyUser : Identifiable {

}
