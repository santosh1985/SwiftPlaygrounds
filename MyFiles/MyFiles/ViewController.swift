//
//  ViewController.swift
//  MyFiles
//
//  Created by Santosh Pawar on 6/23/16.
//  Copyright © 2016 santupavi. All rights reserved.
//

import UIKit
import Photos
import Foundation

class ViewController: UIViewController {

    var images = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let queue = dispatch_queue_create("myQueue", nil)
        
        dispatch_sync(queue) {
            self.allAssets()
        }
    }
    
    private func allAssets() {
        PHPhotoLibrary.requestAuthorization { (status) in
            switch status {
            case .Authorized:
                let fetchOptions = PHFetchOptions()
                let allPhotos = PHAsset.fetchAssetsWithMediaType(.Image, options: fetchOptions)
                print("Found \(allPhotos.count) images")
                allPhotos.enumerateObjectsUsingBlock({ (asset, done, stop) in
                    print(asset)
                    let imageOptions = PHImageRequestOptions()
                    imageOptions.synchronous = true
                    PHImageManager.defaultManager().requestImageDataForAsset(asset as! PHAsset, options: imageOptions, resultHandler: { (data, dataUTI, orientation, info) in
                        print(info!["PHImageFileURLKey"])
                        if let info = info {
                            if let imageURL = info["PHImageFileURLKey"] as? NSURL {
                                if let imageData = NSData.init(contentsOfURL: imageURL) {
                                    if let image = UIImage.init(data: imageData) {
                                        self.images.append(image)
                                    }
                                }
                            }
                        }
                    })
                })
                
            case .Denied, .Restricted:
                print("Not allowed")
            case .NotDetermined:
                print("Not determined yet")
            }
        }
    }

}

