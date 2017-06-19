//
//  AnotherViewController.swift
//  TableV
//
//  Created by Santosh Pawar on 6/24/16.
//  Copyright © 2016 santupavi. All rights reserved.
//

import UIKit

class AnotherViewController: UIViewController {

    @IBOutlet weak var textField4: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateTextField(textField1)
        updateTextField(textField2)
        updateTextField(textField3)
        updateTextField(textField4)
    }

    func updateTextField(textField: UITextField) {

        textField.layer.borderWidth = 0.0
        textField.layer.borderColor = UIColor.whiteColor().CGColor
        textField.layer.masksToBounds = false
        textField.layer.shadowColor = UIColor.grayColor().CGColor
        textField.layer.shadowOpacity = 1.0
        textField.layer.shadowRadius = 50.0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
