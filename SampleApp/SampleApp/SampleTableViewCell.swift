//
//  SampleTableViewCell.swift
//  SampleApp
//

import UIKit

class SampleTableViewCell: UITableViewCell {

    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var cellImageView: UIImageView!
    
    var activityIndicator = UIActivityIndicatorView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        activityIndicator.frame = cellImageView.frame
        activityIndicator.center = cellImageView.center
        activityIndicator.activityIndicatorViewStyle = .gray
        addSubview(activityIndicator)
    }
    
    func showActivityIndicator() {
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
    }
    
    func hideActivityIndicator() {
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
    }
    
}
