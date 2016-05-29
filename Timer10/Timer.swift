//
//  Timer.swift
//  Timer10
//
//  Created by Cesar Ramirez on 1/8/16.
//  Copyright © 2016 Cesar Ramirez. All rights reserved.
//

import Foundation
import CoreData


class Timer: NSManagedObject {
    
    struct keys {
        static let Title = "title"
        static let Time = "time"
        static let Interval = "interval"
    }
    
    override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }
    
    init(dictionary: [String : AnyObject], context: NSManagedObjectContext) {
    
        // Core Data
        let entity =  NSEntityDescription.entityForName("Timer", inManagedObjectContext: context)!
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    
        // Dictionary
        title = dictionary[keys.Title] as? String
        time = dictionary[keys.Time] as? String
        interval = dictionary[keys.Interval] as? String
    
    }

}

