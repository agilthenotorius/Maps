//
//  GeocoderHandler.swift
//  Maps
//
//  Created by Agil Madinali on 10/21/20.
//

import MapKit

protocol GeocoderHandler {
    func geocoding(query: String, completion: @escaping (CLLocation?, CustomError?) -> Void)
}

extension GeocoderHandler {
    
    func geocoding(query: String, completion: @escaping (CLLocation?, CustomError?) -> Void) {
        
        CLGeocoder().geocodeAddressString(query) { placemarks, _ in
            if let placemarks = placemarks,
               let location = placemarks.first?.location {
                completion(location, nil)
            } else {
                completion(nil, CustomError.noLocationFound)
            }
        }
    }
    
    func reverseGeocode(latitude: Double, longitude: Double, completion: @escaping (String?, CustomError?) -> Void) {

        let location = CLLocation(latitude: latitude, longitude: longitude)
        CLGeocoder().reverseGeocodeLocation(location) { placemarks, _ in
            if let placemarks = placemarks,
               let name = placemarks.first?.name,
               let country = placemarks.first?.country,
               let city = placemarks.first?.locality,
               let code = placemarks.first?.postalCode {
                let place = "\(name), \(city), \(country) \(code)"
                completion(place, nil)
            } else {
                completion(nil, CustomError.noLocationFound)
            }
        }
    }
}
