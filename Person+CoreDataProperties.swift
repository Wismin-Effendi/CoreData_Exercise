//
//  Person+CoreDataProperties.swift
//  CoreData_Exercise
//
//  Created by Wismin Effendi on 6/21/17.
//  Copyright © 2017 iShinobi. All rights reserved.
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var age: Int16
    @NSManaged public var gender: String?
    @NSManaged public var location: String?
    @NSManaged public var name: String?

}
