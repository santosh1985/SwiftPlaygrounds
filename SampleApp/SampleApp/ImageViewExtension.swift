//
//  ImageViewExtension.swift
//  SampleApp
//

import UIKit

extension UIImageView {
    
    func imageFromUrl(urlString: String, completion: @escaping (_ done: Bool, _ image: UIImage?) -> (Void)) {
        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                if let imageData = data as Data? {
                    self.image = UIImage(data: imageData)
                    completion(true, self.image)
                }else{
                    completion(false, nil)
                }
            }).resume()
        }
    }
}
