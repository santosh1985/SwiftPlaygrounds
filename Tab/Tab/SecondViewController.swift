//
//  SecondViewController.swift
//  Tab
//
//  Created by Santosh Pawar on 6/21/16.
//  Copyright © 2016 santupavi. All rights reserved.
//

import UIKit
import Alamofire

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Compose, target: self, action: #selector(addNew))
        
        self.tabBarController!.navigationItem.leftBarButtonItem = self.editButtonItem()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func addNew() {
        print("Show called")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    static func sendRequest<T>(method: Alamofire.Method, urlString: String, parameters: [String: AnyObject]?) -> T {
        let response : T
        Alamofire.request(method, urlString, parameters: parameters, encoding: .JSON, headers: nil).validate().responseData { (response) in
            switch response.result {
            case .Success(let value):
                response.valueHandle?(value)
            case .Failure(let error):
                response.errorHandle?(error)
            }
        }
//        Alamofire.request(method, urlString, parameters:parameters)
//            .validate()
//            .responseObject { (response: Response<T, NSError>) in
//                switch response.result {
//                case .Success(let value):
//                    response.valueHandle?(value)
//                case .Failure(let error):
//                    response.errorHandle?(error)
//                }
//        }
        return response
    }
    
    
    
    var valueHandle :((AnyObject) -> ())?
    var errorHandle :((NSError)->())?
    
    func success(value:(AnyObject) -> ())->Self{
        self.valueHandle = value
        return self
    }
    
    func error(error:(NSError)->())->Self{
        self.errorHandle = error
        return self
    }


}

