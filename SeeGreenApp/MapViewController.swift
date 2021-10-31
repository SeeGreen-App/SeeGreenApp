//
//  MapViewController.swift
//  SeeGreenApp
//
//  Created by Alla Baker on 10/25/21.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate {
    
    let map = MKMapView()
    let coordinate = CLLocationCoordinate2D(latitude: 42.1490, longitude: -87.7896)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(map)
        map.frame = view.bounds
        map.setRegion(MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)), animated: false)
        
        map.delegate = self
        
        addCustomPin()
    }
    
    private func addCustomPin() {
        let pin = MKPointAnnotation()
        pin.coordinate = coordinate
        pin.title = "We have plant's here"
        pin.subtitle = "Take a look"
        map.addAnnotation(pin)
    }
    
    
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !(annotation is MKUserLocation)
        else {
            return nil
        }
        
        var annotationView = map.dequeueReusableAnnotationView(withIdentifier: "custom")
        
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "custom")
            annotationView?.canShowCallout = true
        }
        else {
            annotationView?.annotation = annotation
        }
        
        annotationView?.image = UIImage(named: "plant")
        
        
        return annotationView
    }
}
