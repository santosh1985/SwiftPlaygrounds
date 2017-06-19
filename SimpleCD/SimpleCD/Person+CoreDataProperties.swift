//
//  Person+CoreDataProperties.swift
//  SimpleCD
//
//  Created by Santosh Pawar on 6/14/16.
//  Copyright © 2016 santupavi. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Person {

    @NSManaged var firstName: String?
    @NSManaged var lastName: String?
    @NSManaged var dob: String?
    @NSManaged var age: NSNumber?

}
