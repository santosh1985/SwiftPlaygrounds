//
//  HomeCollectionViewController.swift
//  MyFiles
//
//  Created by Santosh Pawar on 6/27/16.
//  Copyright © 2016 santupavi. All rights reserved.
//

import UIKit
import Photos
import Foundation

private let reuseIdentifier = "Cell"


class HomeCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    
    var images = [UIImage]()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.clearsSelectionOnViewWillAppear = true
        collectionView?.backgroundColor = UIColor.blueColor().colorWithAlphaComponent(0.9)
        
        // Register cell classes
        self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        let queue = dispatch_queue_create("myQueue", nil)
        
        dispatch_sync(queue) {
            self.allAssets()
        }
        // Do any additional setup after loading the view.
    }

    private func allAssets() {
        PHPhotoLibrary.requestAuthorization { (status) in
            switch status {
            case .Authorized:
                let fetchOptions = PHFetchOptions()
                let allPhotos = PHAsset.fetchAssetsWithMediaType(.Image, options: fetchOptions)
                print("Found \(allPhotos.count) images")
                allPhotos.enumerateObjectsUsingBlock({ (asset, done, stop) in
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
                    self.collectionView?.reloadData()
                })
                
            case .Denied, .Restricted:
                print("Not allowed")
            case .NotDetermined:
                print("Not determined yet")
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return (images.count > 0) ? images.count : 0
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath)
    
        if images.count > 0 {
            let imageView = UIImageView.init(frame: cell.bounds)
            imageView.image = images[indexPath.row]
            cell.backgroundView = imageView
        }
    
        return cell
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSizeMake(100, 100)
    }
    
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
