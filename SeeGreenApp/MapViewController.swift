//
//  MapViewController.swift
//  SeeGreenApp
//
//  Created by Alla Baker on 10/25/21.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate, UISearchBarDelegate {
    
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var searchClicked: UISearchController!
    
       
        var locationManager = CLLocationManager()

        let authorizationStatus = CLLocationManager.authorizationStatus()
        let regionRadius: Double = 1000
        var numberOfLongPress : Int = 0

        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            mapView.delegate = self
            locationManager.delegate = self
            configureLocationServices()
            locationManager.startUpdatingLocation()
            mapView.showsUserLocation = true
        }

    

     @IBAction func searchClicked(_ sender: Any) {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        present(searchController, animated: true, completion: nil)
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.style = UIActivityIndicatorView.Style.medium
        activityIndicator.center = self.view.center
        activityIndicator.startAnimating()

        self.view.addSubview(activityIndicator)

        //Cancels searchBar
        searchBar.resignFirstResponder()
        dismiss(animated: true, completion: nil)

        // actually search the request
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = searchBar.text

        let activeSearch = MKLocalSearch(request: searchRequest)
        activeSearch.start{ (response, error) in


            if response == nil   // TROUBLE
            {
                print("ERROR")
            }
            else
            {
                //Remove annotations
                let annotations = self.mapView.annotations
                self.mapView.removeAnnotations(annotations)

                //Getting data
                let latitude = response?.boundingRegion.center.latitude
                let longitude = response?.boundingRegion.center.longitude

               //Create annotation
               let annotation = MKPointAnnotation()
               annotation.title = searchBar.text
               annotation.coordinate = CLLocationCoordinate2DMake(latitude!, longitude!)
               self.mapView.addAnnotation(annotation)

                 //Zooming in on annotation
                let coordinate:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude!, longitude!)
                let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
                let region = MKCoordinateRegion(center: coordinate, span: span)
                self.mapView.setRegion(region, animated: true)
            }

        }
    }

    // This function represents the longPress for the app in order to drop a pin with and the address will be displayed
    @IBAction func longPressDetected(_ sender: UILongPressGestureRecognizer) {
        let touchPoint = sender.location(in: mapView)
        let newCoordinates = mapView.convert(touchPoint, toCoordinateFrom: mapView)
        let annotation = MKPointAnnotation()
        annotation.coordinate = newCoordinates
        mapView.addAnnotation(annotation)
        var addressString = ""
        lookUpCurrentLocation(coordinate: newCoordinates) { (placemark) in
        let newPin = MKPointAnnotation()
        newPin.coordinate = newCoordinates
            if let placemark = placemark{
                addressString = "\(String(describing: placemark.subThoroughfare!)) \(String(describing: placemark.thoroughfare!))"
                print(addressString)

                newPin.title = addressString
                self.mapView.addAnnotation(newPin)
            }
        }
    }

    // Gesture recognizer
    func action(gestureRecognizer:UIGestureRecognizer){
        let touchPoint = gestureRecognizer.location(in: mapView)
        let newCoordinates = mapView.convert(touchPoint, toCoordinateFrom: mapView)
        let annotation = MKPointAnnotation()
        annotation.coordinate = newCoordinates
        mapView.addAnnotation(annotation)
    }

    // Centers the map around the current location of the user
    func centerMapOnUserLocation() {
        guard let coordinate = locationManager.location?.coordinate else {return}
        let coordinateRegion = MKCoordinateRegion(center: coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }

    // a function that if the location isn't known, it'll ask to request your location
    func configureLocationServices() {
        if authorizationStatus == .notDetermined {
            locationManager.requestWhenInUseAuthorization()
            locationManager.requestAlwaysAuthorization()
        } else {
            return
        }
    }

    // reverse geoCodes in order to determine the address after the pindrop
    func lookUpCurrentLocation(coordinate: CLLocationCoordinate2D, completionHandler : @escaping (CLPlacemark?)
                    -> Void ) {
        // Use the last reported location.
         let lastLocation = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
            let geocoder = CLGeocoder()

            // Look up the location and pass it to the completion handler
            geocoder.reverseGeocodeLocation(lastLocation,
                        completionHandler: { (placemarks, error) in
                if error == nil {
                    let firstLocation = placemarks?[0]
                    completionHandler(firstLocation)
                }
                else {
                 // An error occurred during geocoding.
                    completionHandler(nil)
                }
            })
    }

    // authorizes devices to access location
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if authorizationStatus == .authorizedWhenInUse || authorizationStatus == .authorizedAlways{
            locationManager.startUpdatingLocation()
        }
        centerMapOnUserLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        centerMapOnUserLocation()
    }
}

