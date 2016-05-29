//
//  Timer+CoreDataProperties.swift
//  Timer10
//
//  Created by Cesar Ramirez on 1/15/16.
//  Copyright © 2016 Cesar Ramirez. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Timer {

    @NSManaged var interval: String?
    @NSManaged var time: String?
    @NSManaged var title: String?

}
