//
//  ViewController.swift
//  Outlet
//
//  Created by Santosh Pawar on 6/27/16.
//  Copyright © 2016 santupavi. All rights reserved.
//

import UIKit

private var myVar = "San"

class ViewController: UIViewController {

    @IBOutlet var customView: UIView!
    var customViewFrame: CGRect?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(myVar)
        customView.backgroundColor = UIColor.blueColor()
    }
    
    @IBAction func remove(sender: AnyObject) {
        customViewFrame = customView.frame
        customView.removeFromSuperview()
    }

    @IBAction func add(sender: AnyObject) {
        if let rect = customViewFrame {
            customView = UIView.init(frame: rect)
            customView.backgroundColor = UIColor.blueColor()

            view.addSubview(customView)
            view.bringSubviewToFront(customView)
        }
    }
    
}

class Temp {
    func Test() {
        print(myVar)
    }
}