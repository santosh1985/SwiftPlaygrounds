//
//  ViewController.swift
//  Table1
//
//  Created by Santosh Pawar on 6/26/16.
//  Copyright © 2016 santupavi. All rights reserved.
//

import UIKit
import AddressBook

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        #if DEBUG
            print("OTHER_SWIFT_FLAGS = -D DEBUG")
//        #endif
        
//        tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "")
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100.0
    }

    func resizedImageWith(image: UIImage, targetSize: CGSize) -> UIImage {
        
        let imageSize = image.size
        let newWidth  = targetSize.width  / image.size.width
        let newHeight = targetSize.height / image.size.height
        var newSize: CGSize
        
        if(newWidth > newHeight) {
            newSize = CGSizeMake(imageSize.width * newHeight, imageSize.height * newHeight)
        } else {
            newSize = CGSizeMake(imageSize.width * newWidth,  imageSize.height * newWidth)
        }
        
        let rect = CGRectMake(0, 0, newSize.width, newSize.height)
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)

        image.drawInRect(rect)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    func adjustTableViewHeight() {
        var height = tableView.contentSize.height
        let maxHeight = (tableView.superview?.frame.size.height)! - self.tableView.frame.origin.y
        
        if height > maxHeight {
            height = maxHeight
        }
        
        UIView.animateWithDuration(0.5) { 
            var frame = self.tableView.frame
            frame.size.height = height
            self.tableView.frame = frame
            self.tableView.setNeedsUpdateConstraints()
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCellWithIdentifier("", forIndexPath: indexPath)
        let cell = UITableViewCell.init(style: .Default, reuseIdentifier: nil)
        
        cell.textLabel?.text = "Only \(indexPath.row)"
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

