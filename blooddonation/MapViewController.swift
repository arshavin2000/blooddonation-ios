//
//  MapViewController.swift
//  blooddonation
//
//  Created by Achref Meghirbi on 4/26/19.
//  Copyright © 2019 Esprit. All rights reserved.
//

import UIKit
import Mapbox
import CoreLocation
import MapKit


class MapViewController: UIViewController,MGLMapViewDelegate {

    struct Center {
        var address : String!
        var fax : String!
        var tel : String!
        var site : String!
        var name :String!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let mapView = MGLMapView(frame: view.bounds)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mapView.setCenter(CLLocationCoordinate2D(latitude: 36.81897, longitude: 10.16579), zoomLevel: 5, animated: true)
        view.addSubview(mapView)
        mapView.styleURL = MGLStyle.satelliteStyleURL
        
        // Add a point annotation
        CenterService.getCenters { (array) in
            for index in 0...array.count-1{
                
                let center  =  array[index]
                let annotation = MGLPointAnnotation()
                let geocoder = CLGeocoder()
                geocoder.geocodeAddressString(center.address) {
                    placemarks, error in
                    let placemark = placemarks?.first
                    let lat = placemark?.location?.coordinate.latitude
                    let lon = placemark?.location?.coordinate.longitude
                    if(lat != nil && lon != nil){
                    annotation.coordinate = CLLocationCoordinate2D(latitude: lat!, longitude: lon!)

                    print("Lat: \(String(describing: lat)), Lon: \(String(describing: lon))")
                    }
                }
                annotation.title = center.name
                annotation.subtitle = center.address + "\n" + center.tel
                
                mapView.addAnnotation(annotation)
            }
        }
       
        
        // Set the map view's delegate
        mapView.delegate = self
        
        // Allow the map view to display the user's location
      //  mapView.showsUserLocation = true
       // mapView.setUserTrackingMode(.followWithCourse, animated: true)
    }
      
    
    func mapView(_ mapView: MGLMapView, annotationCanShowCallout annotation: MGLAnnotation) -> Bool {
        // Always allow callouts to popup when annotations are tapped.

        return true
    }
    
    func mapView(_ mapView: MGLMapView, didSelect annotation: MGLAnnotation) {
        
        let camera = MGLMapCamera(lookingAtCenter: annotation.coordinate, fromDistance: 18500, pitch: 15, heading: 180)
        mapView.fly(to: camera, withDuration: 4,
                    peakAltitude: 3000, completionHandler: nil)
    }
    
  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
