//
//  Photo+CoreDataProperties.swift
//  VirtualTourist
//
//  Created by Gabriele on 9/5/16.
//  Copyright © 2016 Ashley Donohoe. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Photo {

    @NSManaged var title: String?
    @NSManaged var imageURL: String?
    @NSManaged var imageData: NSData?
    @NSManaged var pin: Pin?

}
