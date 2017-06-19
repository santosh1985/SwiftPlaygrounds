//
//  ViewController.swift
//  CoreDataWithSwift
//
//  Created by Santosh Pawar on 7/1/16.
//  Copyright © 2016 santupavi. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var array = [Person]()
    
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        fetch()
    }

    func fetch() {
        array.removeAll()
        let fetchRequest = NSFetchRequest(entityName: "Person")
        fetchRequest.predicate = nil
        do {
            if let results = try managedObjectContext.executeFetchRequest(fetchRequest) as? [Person] {
                if results.count > 0 {
                    for person in results {
                        array.append(person)
                    }
                }
            }
            self.tableView.reloadData()
            
        }catch let error as NSError {
            print(error.description)
        }
    }
    
    @IBAction func logout(sender: AnyObject) {
        
    }
    
    @IBAction func add(sender: AnyObject) {
        for i in 0..<4 {
            Person.createInManagedObjectContext(managedObjectContext, name: "Santosh_\(i)", address: "Maywood_\(i)", age: "20_\(i)")
        }
        do {
            try managedObjectContext.save()
        }catch let error as NSError {
            print(error.description)
        }
    }

    //MARK: - TableView -
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        if array.count > 0 {
            cell.textLabel?.text = "N: \(array[indexPath.row].name!), A:\(array[indexPath.row].address!), Age: \(array[indexPath.row].age!)"
        }
        return cell
    }
}

