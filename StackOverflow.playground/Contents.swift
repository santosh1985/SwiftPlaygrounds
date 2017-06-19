//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class MyRecognitionRequestManager{
    
    func parseJson() -> MyRecognitionHomeModel {
        
        let commentValue = MyRecognitionHomeModel()
        
        let urlPath = "*******************"
        let url = NSURL(string: urlPath)
        let data = NSData(contentsOfURL: url!)
        
        do {
            if let jsonData = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as? NSDictionary {
                if let comment = jsonData.objectForKey("comments") as? NSDictionary {
                    commentValue.jsonData = comment
                }
            }
        }
            
        catch{
            print("Something went wrong while parsing json data fetched from the API")
        }
        
        return commentValue
        
    }
    
}


//model properties class

import Foundation
class MyRecognitionHomeModelProperties {
    
    //MARK: - properties
    var id: String? = "id"
    var message: String? = "message"
    var senderName: String? = "senderName"
    var actionName: String? = "actionName"
    var behavior: String? = "behavior"
    
    init(jsonData: NSDictionary){
        id = jsonData.objectForKey("id") as? String ?? "id"
        message = jsonData.objectForKey("message") as? String ?? "message"
        senderName = jsonData.objectForKey("senderName") as? String ?? "senderName"
        actionName = jsonData.objectForKey("actionName") as? String ?? "actionName"
        behavior = jsonData.objectForKey("behavior") as? String ?? "behavior"
        
    }
    
    init(id: String,message: String, senderName: String, actionName: String,behavior: String) {
        self.id = id
        self.message = message
        self.senderName = senderName
        self.actionName = actionName
        self.behavior = behavior
    }
    
    init() {
        id = nil
        message = nil
        senderName = nil
        actionName = nil
        behavior = nil
    }
    
    //prints object's UserInformation
    var description: String {
        return "id:\(id),message: \(message),senderName: \(senderName), actionName: \(actionName),behavior: \(behavior)"
        
    }
    
}

class MyRecognitionHomeModel{
    
    var commentResults = [MyRecognitionHomeModelProperties]()
    
    var jsonData: NSDictionary? = nil {
        didSet {
            if let data = jsonData {
                if let comments = data.objectForKey("comments") as? [NSDictionary] {
                    for comment in comments {
                        let commentValue = MyRecognitionHomeModelProperties(jsonData: comment)
                        commentResults.append(commentValue)
                    }
                }
            }
        }
    }
}

class MyRecognitionTableViewController: UITableViewController {
    
    let requestManager = MyRecognitionRequestManager()
    var commentValue = MyRecognitionHomeModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
        commentValue.jsonData = requestManager.parseJson().jsonData
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return commentValue.commentResults.count
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("MyRecognitionCell", forIndexPath: indexPath) as!  MyRecognitionTableViewCell
        
        // Configure the cell...
        cell.senderName?.text = commentValue.senderName
        cell.actionName?.text = commentValue.actionName
        cell.message?.text = commentValue.message
        return cell
    }
}