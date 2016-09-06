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
}

