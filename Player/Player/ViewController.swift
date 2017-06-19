//
//  ViewController.swift
//  Player
//
//  Created by Santosh Pawar on 7/12/16.
//  Copyright © 2016 santupavi. All rights reserved.
//

import UIKit
import Foundation
import AVFoundation
import AVKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let url = NSURL(string: "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
        let player = AVPlayer.init(url: url as! URL)
        let playerVC = AVPlayerViewController()
        playerVC.player = player
        playerVC.view.frame = CGRect(x: 0, y:0, width: 100, height: 200)
        view.addSubview(playerVC.view)
        addChildViewController(playerVC)
        player.play()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

