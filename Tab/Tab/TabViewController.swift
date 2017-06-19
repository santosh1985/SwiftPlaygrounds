//
//  TabViewController.swift
//  Tab
//
//  Created by Santosh Pawar on 6/21/16.
//  Copyright © 2016 santupavi. All rights reserved.
//

import UIKit

class TabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        segue.destinationViewController.hidesBottomBarWhenPushed = true
        
        let image = UIImage.imageWith(UIImage(named: "holy-grail-pub-logo-header-logo")!, scaledToSize: CGSizeMake(80,80))
        let imageView = UIImageView()
        imageView.frame = CGRectMake(0, 0, 100, 100)
        imageView.contentMode = .ScaleAspectFit
        imageView.image = image
        
        NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: #selector(delayedHideTableView), userInfo: nil, repeats: false)
    }
    
    func delayedHideTableView() {
        

    }

}


extension UIImage {
    
    class func imageWith(image: UIImage, scaledToSize: CGSize) -> UIImage {
        //UIGraphicsBeginImageContext(newSize);
        // In next line, pass 0.0 to use the current device's pixel scaling factor (and thus account for Retina resolution).
        // Pass 1.0 to force exact pixel size.
        UIGraphicsBeginImageContextWithOptions(scaledToSize, false, 0.0)
        image.drawInRect(CGRectMake(0, 0, scaledToSize.width, scaledToSize.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
}