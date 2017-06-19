//
//  ViewController.swift
//  HonoluluArt
//
//  Created by Santosh Pawar on 6/21/16.
//  Copyright © 2016 santupavi. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    let regionRadius: CLLocationDistance = 1000
    var artworks = [Artwork]()
    var locationManager = CLLocationManager()
    
    func checkLocationAuthorizationStatus() {
        if CLLocationManager.authorizationStatus()  == .AuthorizedWhenInUse {
            mapView.showsUserLocation = true
        }else{
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        checkLocationAuthorizationStatus()
    }
    
    func loadInitialData() {
        if let filename = NSBundle.mainBundle().pathForResource("PublicArt", ofType: "json") {
            let data = NSData(contentsOfFile: filename)
            do {
                guard let jsonObject = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as? [String: AnyObject] else {
                    return
                }
                let jsonData = JSONValue.fromObject(jsonObject)?["data"]?.array
                if jsonData?.count > 0 {
                    for artworkJson in jsonData! {
                        if let json = artworkJson.array {
                            let artwork = Artwork.fromJSON(json)
                            artworks.append(artwork!)
                        }
                    }
                }
            }catch let error as NSError {
                print(error.description)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        
        //Set initial location
        let initialLocation = CLLocation(latitude: 21.282778, longitude: -157.829444)
        centerMapOnLocation(initialLocation)
        
//        let artwork = Artwork(title: "King David Kalakaua", locationName: "Waikiki Gateway Park", discipline: "Sculpture", coordinate: CLLocationCoordinate2D(latitude: 21.283921, longitude: -157.831661))
//        
//        mapView.addAnnotation(artwork)
        loadInitialData()
        mapView.addAnnotations(artworks)
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2, regionRadius * 2)
        mapView.setRegion(coordinateRegion, animated: true)
    }

}

extension ViewController: MKMapViewDelegate {
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = annotation as? Artwork {
            let identifier = "pin"
            var annotationView: MKAnnotationView
            if let dequeuedView = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier)  {
                dequeuedView.annotation = annotation
                annotationView = dequeuedView
            } else {
                annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                annotationView.canShowCallout = true
                annotationView.calloutOffset = CGPoint(x: -5, y: 5)
                annotationView.rightCalloutAccessoryView = UIButton.init(type: .DetailDisclosure)
            }
//            (annotationView as! MKPinAnnotationView).pinColor = annotation.pinColor()
            let pinImage = UIImage(named: "NYC")
            let size = CGSize(width: 50, height: 50)
            UIGraphicsBeginImageContext(size)
            pinImage!.drawInRect(CGRectMake(0, 0, size.width, size.height))
            
            let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
            
            annotationView.image = resizedImage
            annotationView.layer.cornerRadius = 25
//            annotationView.layer.masksToBounds = true
            UIGraphicsEndImageContext()
            return annotationView
        }
        return nil
    }
    
    func mapView(mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let location = view.annotation as! Artwork
        let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
        location.mapItem().openInMapsWithLaunchOptions(launchOptions)
    }
}