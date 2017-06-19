//
//  FirstViewController.swift
//  Tab
//
//  Created by Santosh Pawar on 6/21/16.
//  Copyright © 2016 santupavi. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    var myText = FirstViewController().textField.text! {
        didSet {
            textField.text = "89090"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

