//
//  MyViewController.swift
//  TableV
//
//  Created by Santosh Pawar on 6/24/16.
//  Copyright © 2016 santupavi. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class MyViewController: AVPlayerViewController {
    
//    var url = NSURL()
    var test = "Testing a string init"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let filePath = NSBundle.mainBundle().pathForResource("Sample", ofType: "mp4") {
            let avPlayerLayer = AVPlayerLayer(player: player)
            avPlayerLayer.frame = self.view.frame
            view.layer .addSublayer(avPlayerLayer)
            let steamingURL = NSURL(fileURLWithPath: filePath)
            player = AVPlayer(URL: steamingURL as NSURL)
            player!.play()
        }
    }

    func testACall(val: String) {
        print(val)
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
