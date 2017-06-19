//
//  Person.swift
//  SimpleCD
//
//  Created by Santosh Pawar on 6/14/16.
//  Copyright © 2016 santupavi. All rights reserved.
//

import Foundation
import CoreData

@objc(Person)
class Person: NSManagedObject {

    class func createData(moc: NSManagedObjectContext, firstName: String, lastName: String, dob: String, age: NSNumber) -> Person {
        
        let entityDescription = NSEntityDescription.entityForName("Person", inManagedObjectContext: moc)
        let newPerson = NSManagedObject(entity: entityDescription!, insertIntoManagedObjectContext: moc) as! Person
        
        newPerson.firstName = firstName
        newPerson.lastName = lastName
        newPerson.age = age
        newPerson.dob = dob
        
        return newPerson
    }

}
