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
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: "addPin:")
        longPressGesture.minimumPressDuration = 0.3
        mapView.addGestureRecognizer(longPressGesture)
        
        mapView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addPin(gestureRecognizer: UIGestureRecognizer) {
        print("Long press")
        
    }
    
    

}

