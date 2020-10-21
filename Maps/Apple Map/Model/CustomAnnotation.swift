//
//  CustomAnnotation.swift
//  Maps
//
//  Created by Agil Madinali on 10/21/20.
//

import MapKit

class CustomAnnotation: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(coordinate: CLLocationCoordinate2D, title: String, subtitle: String) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
    
    init(place: Place) {
        self.coordinate = place.coordinates.coordinates
        self.title = place.name
    }
}
