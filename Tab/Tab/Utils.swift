//
//  Utils.swift
//  Tab
//
//  Created by Santosh Pawar on 6/21/16.
//  Copyright © 2016 santupavi. All rights reserved.
//

import UIKit

class Utils {
    static func setNavigationControllerStatusBar(myView: UIViewController, title: String, color: CIColor, style: UIBarStyle) {
        let navigation = myView.navigationController!
        navigation.navigationBar.barStyle = style
        navigation.navigationBar.barTintColor = UIColor(CIColor: color)
        navigation.navigationBar.translucent = false
        navigation.navigationBar.tintColor = UIColor.whiteColor()
        myView.navigationItem.title = title
        
        let menuButton = UIBarButtonItem(image: UIImage(named: "menu"),
                                         style: UIBarButtonItemStyle.Plain ,
                                         target: self, action: #selector(menuClicked(_:)))
        
        myView.navigationItem.leftBarButtonItem = menuButton
    }
    
    @objc func menuClicked(sender: UIButton!) {
        // do stuff
    }
}
