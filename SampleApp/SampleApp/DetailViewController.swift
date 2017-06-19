//
//  DetailViewController.swift
//  SampleApp
//
import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override var prefersStatusBarHidden: Bool {
        return true
    } 
    var cellData: (name: String, image: UIImage)? {
        didSet {
            configureView()
        }
    }
        
    func configureView() {
        if let data = cellData {
            if let detailDescriptionLabel = detailDescriptionLabel, let candyImageView = imageView {
                detailDescriptionLabel.text = data.name
                candyImageView.image = data.image
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

