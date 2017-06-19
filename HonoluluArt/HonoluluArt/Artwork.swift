//
//  Artwork.swift
//  HonoluluArt
//
//  Created by Santosh Pawar on 6/21/16.
//  Copyright © 2016 santupavi. All rights reserved.
//

import UIKit
import MapKit
import AddressBook

class Artwork: NSObject, MKAnnotation {

    var title: String?
    var locationName: String
    var discipline: String
    var coordinate: CLLocationCoordinate2D
    
    var subtitle: String? {
        return locationName
    }
    
    init(title: String, locationName: String, discipline: String, coordinate: CLLocationCoordinate2D) {
        
        self.title = title
        self.locationName = locationName
        self.discipline = discipline
        self.coordinate = coordinate
        
        super.init()
    }
    
    class func fromJSON(json: [JSONValue]) -> Artwork? {
        
        var title: String
        if let titleOrNil = json[16].string {
            title = titleOrNil
        }else{
            title = ""
        }
        
        let locationName = json[12].string
        let discipline = json[15].string
        let latitude = Double(json[18].string!)
        let longitude = Double(json[19].string!)
        let coordinate = CLLocationCoordinate2D(latitude: latitude!, longitude: longitude!)
        
        return Artwork(title: title, locationName: locationName!, discipline: discipline!, coordinate: coordinate)
    }
    
    // annotation callout info button opens this mapItem in Maps app

    func mapItem() -> MKMapItem {
        let addressDirectory = [String(kABPersonAddressStreetKey): subtitle as! AnyObject]
        let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: addressDirectory)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = title
        return mapItem
    }
    
    // pinColor for disciplines: Sculpture, Plaque, Mural, Monument, other
    func pinColor() -> MKPinAnnotationColor  {
        switch discipline {
        case "Sculpture", "Plaque":
            return .Red
        case "Mural", "Monument":
            return .Purple
        default:
            return .Green
        }
    }
    
}
