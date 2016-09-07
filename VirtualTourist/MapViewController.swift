//
//  MapViewController.swift
//  VirtualTourist
//
//  Created by Ashley Donohoe on 9/5/16.
//  Copyright © 2016 Ashley Donohoe. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    let flickrClient = FlickrAPIClient.sharedInstance()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Referenced code for long press with map pins from http://juliusdanek.de/blog/coding/2015/07/14/persistent-pins-tutorial/
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(MapViewController.addPin(_:)))
        longPressGesture.minimumPressDuration = 0.5
        mapView.addGestureRecognizer(longPressGesture)
        
        mapView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addPin(gestureRecognizer: UIGestureRecognizer) {
        // Referenced code for long press with map pins from http://juliusdanek.de/blog/coding/2015/07/14/persistent-pins-tutorial/
        
        let placeTapped: CGPoint = gestureRecognizer.locationInView(mapView)
        let coordinateTapped: CLLocationCoordinate2D = mapView.convertPoint(placeTapped, toCoordinateFromView: mapView)
        print("\(coordinateTapped.latitude) \(coordinateTapped.longitude)")
        
        if UIGestureRecognizerState.Began == gestureRecognizer.state {
            let newPin = MKPointAnnotation()
            newPin.coordinate = coordinateTapped
            mapView.addAnnotation(newPin)
        }
    }
    
    func searchForPhotosByLocation(latitude: Double, longitude: Double) {
        
        // Add the pin's coordinates and other info to method params for Flickr API call
        let methodParameters = [
            FlickrAPIClient.ParameterKeys.Method: FlickrAPIClient.ParameterValues.SearchMethod,
            FlickrAPIClient.ParameterKeys.ApiKey: FlickrAPIClient.ParameterValues.ApiKey,
            FlickrAPIClient.ParameterKeys.BoundingBox: bboxString(latitude, longitude: longitude),
            FlickrAPIClient.ParameterKeys.Extras: FlickrAPIClient.ParameterValues.MediumURL,
            FlickrAPIClient.ParameterKeys.Format: FlickrAPIClient.ParameterValues.ResponseFormat,
            FlickrAPIClient.ParameterKeys.NoCallback: FlickrAPIClient.ParameterValues.NoCallback
        ]
        
        flickrClient.getImagesFromFlickr(methodParameters) { (success, errorString) in
            // TBD
        }
    }
    
    // Function taken from FlickFinder to get the bbox to use as parameter
    func bboxString(latitude: Double?, longitude: Double?) -> String {
        // ensure bbox is bounded by minimum and maximums
        if let latitude = latitude, let longitude = longitude {
            let minimumLon = max(longitude - FlickrAPIClient.FlickrConstants.SearchBBoxHalfWidth, FlickrAPIClient.FlickrConstants.SearchLonRange.0)
            let minimumLat = max(latitude - FlickrAPIClient.FlickrConstants.SearchBBoxHalfHeight, FlickrAPIClient.FlickrConstants.SearchLatRange.0)
            let maximumLon = min(longitude + FlickrAPIClient.FlickrConstants.SearchBBoxHalfWidth, FlickrAPIClient.FlickrConstants.SearchLonRange.1)
            let maximumLat = min(latitude + FlickrAPIClient.FlickrConstants.SearchBBoxHalfHeight, FlickrAPIClient.FlickrConstants.SearchLatRange.1)
            return "\(minimumLon),\(minimumLat),\(maximumLon),\(maximumLat)"
        } else {
            return "0,0,0,0"
        }
    }
}

