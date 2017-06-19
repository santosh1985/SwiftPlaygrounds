//
//  Person.swift
//  CoreDataWithSwift
//
//  Created by Santosh Pawar on 7/1/16.
//  Copyright © 2016 santupavi. All rights reserved.
//

import Foundation
import CoreData


class Person: NSManagedObject {

    class func createInManagedObjectContext(moc: NSManagedObjectContext, name: String, address: String, age: String) -> Person {
        
        let new = NSEntityDescription.insertNewObjectForEntityForName("Person", inManagedObjectContext: moc) as! Person
        new.name = name
        new.address = address
        new.age = age
        
        return new
    }

}
