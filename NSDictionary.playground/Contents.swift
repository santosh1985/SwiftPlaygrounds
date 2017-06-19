//: Playground - noun: a place where people can play

import UIKit

//===================================

var myDictOfDict = [
    "key1" : ["fname":"abc", "lname":"cde"],
    "key2" : ["fname":"abc"]
]

//print(myDictOfDict)
//print(myDictOfDict["key2"])

//loop through array of dicts

func download_request() -> String? {
    var urlContents: String?
    let url:NSURL = NSURL(string: "http://url.com/read.php")!
    let session = NSURLSession.sharedSession()
    
    let request = NSMutableURLRequest(URL: url)
    request.HTTPMethod = "POST"
    request.cachePolicy = NSURLRequestCachePolicy.ReloadIgnoringCacheData
    
    let paramString = "data=name"
    request.HTTPBody = paramString.dataUsingEncoding(NSUTF8StringEncoding)
    
    let task = session.downloadTaskWithRequest(request) {
        
        (let location, let response, let error) in
        
        guard let _:NSURL = location, let _:NSURLResponse = response  where error == nil else {
            print("Error")
            return
        }
        urlContents = try! NSString(contentsOfURL: location!, encoding: NSUTF8StringEncoding) as String
        guard let _:NSString = urlContents else {
            print("Error")
            return
        }
    }
    
    task.resume()
    return urlContents
}

let dict = NSDictionary()
var anyDict = [String: Any?]()

for (value, key) in dict {
    anyDict = [key as! String: value]
}
