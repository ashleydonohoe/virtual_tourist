//
//  FlickrAPIClient.swift
//  VirtualTourist
//
//  Created by Ashley Donohoe on 9/5/16.
//  Copyright © 2016 Ashley Donohoe. All rights reserved.
//

import Foundation
import UIKit

class FlickrAPIClient: NSObject {
    
    //Allows client to act as singleton
    class func sharedInstance() -> FlickrAPIClient {
        struct Singleton {
            static var sharedInstance = FlickrAPIClient()
        }
        return Singleton.sharedInstance
    }
    
    // Constants for API use
    // Reused some of these from FlickFinder app in iOS Networking course
    
    struct FlickrConstants {
        static let FlickrScheme = "https"
        static let FlickrHost = "api.flickr.com"
        static let FlickrPath = "/services/rest"
        static let SearchBBoxHalfWidth = 1.0
        static let SearchBBoxHalfHeight = 1.0
        static let SearchLatRange = (-90.0, 90.0)
        static let SearchLonRange = (-180.0, 180.0)
    }
    
    struct ParameterKeys {
        static let Method = "method"
        static let ApiKey = "api_key"
        static let Format = "format"
        static let Extras = "extras"
        static let NoCallback = "nojsoncallback"
        static let BoundingBox = "bbox"
    }
    
    struct ParameterValues {
        static let SearchMethod = "flickr.photos.search"
        static let ApiKey = "edb1d29a2985947d3cd2410b3f62a2dc"
        static let ResponseFormat = "json"
        static let NoCallback = "1"
        static let MediumURL = "url_m"
    }
    
    struct ResponseKeys {
        static let Status = "stat"
        static let Photos = "photos"
        static let Photo = "photo"
        static let MediumURL = "url_m"
        static let Total = "total"
    }
    
    struct ResponseValues {
        static let OKStatus = "ok"
    }

    // Method to create Flickr URL
    
    func createFlickrURL(parameters: [String: AnyObject]) -> NSURL {
        let components = NSURLComponents()
        components.scheme = FlickrConstants.FlickrScheme
        components.host = FlickrConstants.FlickrHost
        components.path = FlickrConstants.FlickrPath
        components.queryItems = [NSURLQueryItem]()
        
        for(key, value) in parameters {
            let queryItem = NSURLQueryItem(name: key, value: "\(value)")
            components.queryItems!.append(queryItem)
        }
        
        return components.URL!
    }

    // TODO: Add Flickr method for downloading images by location
    
    func getImagesFromFlickr(methodParameters: [String: AnyObject], completionHanderForGetImages: (success: Bool, errorString: String?) -> Void) {
        
        let session = NSURLSession.sharedSession()
        let request = NSURLRequest(URL: createFlickrURL(methodParameters))
    }

}
