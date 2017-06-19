//
//  ViewController.swift
//  TableV
//
//  Created by Santosh Pawar on 6/22/16.
//  Copyright © 2016 santupavi. All rights reserved.
//

import UIKit
import MediaPlayer
import AVKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    let playerVC = AVPlayerViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let testFile = TestFile()
        testFile.test()
        
        let imageView = UIImageView()
        imageView.frame = tableView.bounds
        imageView.image = UIImage(named: "BG")
        tableView.backgroundView = imageView
        
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = imageView.bounds
        blurEffectView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight] // for supporting device rotation
        imageView.addSubview(blurEffectView)
        tableView.sendSubviewToBack(blurEffectView)
        
        tableView.rowHeight = UITableViewAutomaticDimension + 80.0
        tableView.estimatedRowHeight = 100.0
        tableView.separatorStyle = .SingleLine
        tableView.separatorEffect = blurEffect
        
        tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "cell")
        
        cell.backgroundColor = UIColor.clearColor()
        if indexPath.row % 2 == 0 {
            cell.textLabel?.text = "Santosh".uppercaseString
            cell.textLabel?.textColor = UIColor.whiteColor()
            cell.detailTextLabel?.textColor = UIColor.whiteColor()
        }else{
            cell.textLabel?.text = "Pavithra".uppercaseString
            cell.textLabel?.textColor = UIColor.orangeColor()
            cell.detailTextLabel?.textColor = UIColor.orangeColor()
        }
        cell.selectionStyle = .Blue
        cell.detailTextLabel?.numberOfLines = 0
        cell.detailTextLabel?.text = "Santosh Pawar\nPavithra Pawar"
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
       
        if indexPath.row % 2 == 0 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewControllerWithIdentifier( "AnotherViewController") as! AnotherViewController
            debugPrint("Printing for the sake of initializing view of VC: \(vc.view)")
            print(vc.view)
            print(vc.textField1)
            vc.updateTextField(vc.textField2)
//            presentViewController(vc, animated: true, completion: nil)
        }else{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewControllerWithIdentifier( "MyViewController") as! MyViewController
//            print(vc.view)
            print(vc.test)
            vc.testACall(vc.test)
//            print(vc.url)
//            presentViewController(vc, animated: true, completion: nil)
        }
        
    }

     func tableView(tableView: UITableView, shouldHighlightRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
     func tableView(tableView: UITableView, didHighlightRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        cell?.contentView.backgroundColor = UIColor.orangeColor()
        cell?.backgroundColor = UIColor.orangeColor()
    }
    
     func tableView(tableView: UITableView, didUnhighlightRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        cell?.contentView.backgroundColor = UIColor.clearColor()
        cell?.backgroundColor = UIColor.clearColor()
    }
}

