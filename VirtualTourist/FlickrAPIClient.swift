//
//  FlickrAPIClient.swift
//  VirtualTourist
//
//  Created by Gabriele on 9/5/16.
//  Copyright © 2016 Ashley Donohoe. All rights reserved.
//

import Foundation
import UIKit

class FlickrAPIClient: NSObject {
    
    // Constants for API use
    // Reused some of these from FlickFinder app in iOS Networking course
    
    struct FlickrConstants {
        static let FlickrBaseURL = "https://api.flickr.com/services/rest/?"
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

    // TODO: Add method to create BBOX

    // TODO: Add method to create Flickr URL

    // TODO: Add Flickr method for downloading images by location

}
