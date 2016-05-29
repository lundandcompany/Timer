//
//  ViewController.swift
//  Timer10
//
//  Created by Cesar Ramirez on 1/7/16.
//  Copyright © 2016 Cesar Ramirez. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchAllTimers()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func viewDidAppear(animated: Bool) {
        
   
        
        
        
    }

    
    
    
    
    
    func fetchAllTimers() -> [Timer] {
        
        print("Fetching Timers")
        
        // Create the Fetch Request
        let fetchRequest = NSFetchRequest(entityName: "Timer")
        
        // Execute the Fetch Request
        do {
            return try sharedContext.executeFetchRequest(fetchRequest) as! [Timer]
        } catch  let error as NSError {
            print("Error in fetchAllActors(): \(error)")
            return [Timer]()
        }
    }
    
    
    lazy var sharedContext: NSManagedObjectContext =  {
        return AppDelegate().managedObjectContext
    }()
    
    func saveContext() {
        
        AppDelegate().saveContext()
        
    }
    
    
    
}

