//
//  Person+CoreDataProperties.swift
//  CoreDataWithSwift
//
//  Created by Santosh Pawar on 7/1/16.
//  Copyright © 2016 santupavi. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Person {

    @NSManaged var name: String?
    @NSManaged var address: String?
    @NSManaged var age: String?

}
