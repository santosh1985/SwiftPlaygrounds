//
//  ViewController.swift
//  SimpleCD
//
//  Created by Santosh Pawar on 6/14/16.
//  Copyright © 2016 santupavi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var customView: CustomScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customView.backgroundColor = UIColor.lightGrayColor()
        customView.contentSize = CGSizeMake(self.view.bounds.size.width, 1000)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

