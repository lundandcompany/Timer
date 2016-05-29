//
//  TimerTableViewController.swift
//  Timer10
//
//  Created by Cesar Ramirez on 1/7/16.
//  Copyright © 2016 Cesar Ramirez. All rights reserved.
//

import Foundation
import UIKit
import CoreData



class TimerTableViewController: UITableViewController{
    
    
    var timers = [Timer]()
    
    var binaryCount = 60
    var timer = NSTimer()
    
    
    override func viewWillAppear(animated: Bool) {
        
        
        fetchAllTimers()
        
        print("appeared")
        
        tableView.reloadData()
       
        }
        
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.parentViewController!.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Refresh, target: self, action: "refresh")
//        
//        self.parentViewController!.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Reply, target: self, action: "Logout")
//        
        
        
        fetchAllTimers()
        
        tableView.reloadData()
        
        
//        binaryCount = 0
//        timer = NSTimer(timeInterval: 1.0, target: self, selector: "countUp", userInfo: nil, repeats: true)
//        NSRunLoop.currentRunLoop().addTimer(timer, forMode: NSRunLoopCommonModes)
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")

    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
      //  print(self.timers.count)
        return self.timers.count;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      //  let cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        
        
        let cellIdentifier = "tableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! tableViewCell
    
        
        let timer = timers[indexPath.row]
        
        let timerTitle = timer.title! 
        let timerTime = timer.time!
        let timerInterval = timer.interval!
        
        cell.timerTime.text = timerTime + ":00"
        cell.timerTitle.text = timerTitle
        cell.timerInterval.text = timerInterval + ":00"
        
      //  cell.timeSeconds.text = String(binaryCount)
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    
        let viewController = self.storyboard?.instantiateViewControllerWithIdentifier("runTimer") as! runTimer
        viewController.timer = timers[indexPath.row]
        self.presentViewController(viewController, animated: true, completion: nil)
        
        
    }
    
    
    
//    let indexPath = tableView.indexPathForSelectedRow
//    
//    let currentCell = tableView.cellForRowAtIndexPath(indexPath!)! as! tableViewCell
//    
//    var seconds: Int = Int(currentCell.timeSeconds.text!)!
//    
//    print (seconds)
//    
//    binaryCount = seconds
//    timer = NSTimer(timeInterval: 1.0, target: self, selector: "countUp", userInfo: nil, repeats: true)
//    NSRunLoop.currentRunLoop().addTimer(timer, forMode: NSRunLoopCommonModes)
//    
//    currentCell.timeSeconds.text = String(binaryCount)
    
    
    
    //        var timer = timers[indexPath.row]
    //
    //       let timeString = timer.time
    //
    //
    //     //   var pi: Int
    //
    //        countUp(timeString!){ (results) in
    //
    //           //print results
    //          let poo = results
    //
    //            print(poo)
    
    //    }
    
    
    //  print(pi)
    
    
    
    
    //   timer.time = String(pi)
    
    // tableView.reloadData()
    
//    var timer = timers[indexPath.row]
//    
//    let timeString = timer.time
//    
//    
//
//    
//    
//    var pi: Int = Int(timeString!)!
//    
//    print(pi)
//    
//    pi = (pi - 1)
//    
//    timer.time = String(pi)
//    
//    tableView.reloadData()
    
    
    
    
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        let ret = UILabel(frame: CGRectMake(10, 0, self.tableView.frame.width - 30, 32.0))
        ret.backgroundColor = UIColor.clearColor()
        ret.text = " "
        ret.textAlignment = NSTextAlignment.Center
        return ret
    }
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let start = UITableViewRowAction(style: .Normal, title: " Start ") { action, index in
            print("more button tapped")
            let vc = ViewController() //change this to your class name
            self.presentViewController(vc, animated: true, completion: nil)
        }
        start.backgroundColor = UIColor.lightGrayColor()
        
        let stop = UITableViewRowAction(style: .Normal, title: " Stop ") { action, index in
            print("favorite button tapped")
            
            
        //    tableView.cellForRowAtIndexPath(<#T##indexPath: NSIndexPath##NSIndexPath#>)
            
            
            
            
            
            
        }
        stop.backgroundColor = UIColor.redColor()
        

        
        return [start, stop]
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // the cells you would like the actions to appear needs to be editable
        return true
    }
override     
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        // you need to implement this method too or you can't swipe to display the actions
    }
    

    
    
    func countUp() {
        
        binaryCount--
        
        //   print(binaryCount)
        
        print(binaryCount)
        
        tableView.reloadData()
        
       
        
    }
    
    
    
    
    
    @IBOutlet weak var number: UITextField!
    
    @IBOutlet var labelForBinaryCount: UILabel!
    

    
    //    @IBAction func datePickerAction(sender: AnyObject) {
    //
    //        let dateFormatter = NSDateFormatter()
    //        dateFormatter.dateFormat = "HH:mm"
    //        timeData = dateFormatter.stringFromDate(datePickerAction(<#T##sender: AnyObject##AnyObject#>))
    //        print(timeData)
    //    }
    
    
    
    
    func start(timer: Timer) {
//        
//        //  playAlarm()
//    
//       // let timer = timers[indexPath.row]
//    
//        let timeData : Int? = timer.time! as? Int  //labelForBinaryCount.text.toint()
//           print(number.text)
//        let pi = NSNumberFormatter().numberFromString(number.text!)?.integerValue
//        
//        print(pi)
//    
//        binaryCount = 10 //pi!
//        timer = NSTimer(timeInterval: 1.0, target: self, selector: "countUp", userInfo: nil, repeats: true)
//        NSRunLoop.currentRunLoop().addTimer(timer, forMode: NSRunLoopCommonModes)
    }
    
  
    
    
    
//    func countUp(number: String , completionHandler: (result: Int?) -> Void) {
//    
//
//     //   number --
//        
//        var result: Int  = Int(number)!
//        
//        result--
//        
//        completionHandler(result: result)
//        
//       // tableView.reloadData()
//        
////        if binaryCount == 0 {
////            reset()
////        }
//        
//    }
    
    @IBAction func reset() {
        
        //    bgMusic.stop()
        
        
        timer.invalidate()
        
        binaryCount = 0
      //  updateText()
    }
    
//    func updateText() {
//        
//        
//        labelForBinaryCount.text = "\(binaryCount)"
//    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func fetchAllTimers() {    //-> [Timer] {

        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        //2
        let fetchRequest = NSFetchRequest(entityName: "Timer")
        
        //3
        do {
            
        let results = try sharedContext.executeFetchRequest(fetchRequest) as! [Timer]
        
            timers = results
            print("TTTTTTTTFHGFHGJGUGHGJGUYGYUGGUYGJYGHYUGUY")
            print (timers)
            
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }
    
    
    var sharedContext: NSManagedObjectContext =  {
        return AppDelegate().managedObjectContext
    }()
    
    func saveContext() {
        AppDelegate().saveContext()
        
        }
    
    }
    
    
    

