//
//  testTimer.swift
//  Timer10
//
//  Created by Cesar Ramirez on 1/8/16.
//  Copyright © 2016 Cesar Ramirez. All rights reserved.
//

import Foundation
import UIKit

struct  Testtime {
    
    var timers = [Testtime]()
    
    var title: String
    var time: Int32
    var interval: Int32
    
    
    init (title: String, time: Int32, interval: Int32){
        self.title = title
        self.time = time
        self.interval = interval

    }
    
    
}


