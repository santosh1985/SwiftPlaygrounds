//
//  CachedImage.swift
//  SampleApp
//

import Foundation
import UIKit

class CachedImage: NSCache<AnyObject, AnyObject> {

    static let shared = CachedImage()

    func cacheImage(image: UIImage, for key: String) {
        setObject(image, forKey: key as AnyObject)
    }
    
    func cachedImageFor(key: AnyObject) -> UIImage {
        return object(forKey: key)! as! UIImage
    }
}
