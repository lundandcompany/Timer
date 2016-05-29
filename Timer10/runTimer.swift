//
//  runTimer.swift
//  Timer10
//
//  Created by Cesar Ramirez on 1/17/16.
//  Copyright © 2016 Cesar Ramirez. All rights reserved.
//

import Foundation
import UIKit
import CoreData
import Social
import AVFoundation


class runTimer: UIViewController{
    
    var timer: Timer?
    var originalInterval: String?
    var binaryCount = 10
    
        var play:AVAudioPlayer = AVAudioPlayer()
    
    var counter = NSTimer()
    
    
    var seconds = 59
    var time = 0
    var interval = 0
    
    
    @IBAction func startTime(sender: AnyObject) {
        start()
    }
    
    
    @IBOutlet weak var timerTitle: UILabel!
    @IBOutlet weak var timerTime: UILabel!
    @IBOutlet weak var timerInterval: UILabel!
    @IBOutlet weak var timerStart: UIButton!
    @IBOutlet weak var timerCancel: UIButton!
    

    
    
    override func viewDidLoad() {
               
        timerTitle.text = timer?.title
        timerTime.text = (timer?.time)! + ":00"
        timerInterval.text = (timer?.interval)! + ":00"
        
        originalInterval = (timer?.interval)!

        
        
    }
    
    func start(){
            binaryCount = 59
        
        
        time = Int((timer?.time)!)!
        interval = Int((timer?.interval)!)!
        
        time--
        interval--
        
        
            counter = NSTimer(timeInterval: 1.0, target: self, selector: "countUp", userInfo: nil, repeats: true)
            NSRunLoop.currentRunLoop().addTimer(counter, forMode: NSRunLoopCommonModes)
        
        
    }
    

    @IBAction func cancel(sender: AnyObject) {
        
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("timerTableViewController") as! TimerTableViewController
        self.presentViewController(vc, animated: true, completion: nil)
        
         }
    
    
    
    
    func countUp() {
        
        binaryCount--
        
               
        timerTime.text = String(time) + ":" + String(binaryCount)
        timerInterval.text = String(interval) + ":" + String(binaryCount)
        
        if binaryCount < 10 {
            
            timerTime.text = String(time) + ":" + "0" + String(binaryCount)
            timerInterval.text = String(interval) + ":" + "0" + String(binaryCount)
            
            
            
        }

        
        if binaryCount == 0 {

            
            
            if interval == 0 {
               interval = Int((timer?.interval)!)!
                interval--
                playSound("short")
            }
            
            
            if time == 0  {
//                time = Int((timer?.time)!)!
//                time--
                
                timerDone()
                

            }
            
            
            if time != 0{
            time--
            }
            if interval != 0{
            interval--
            }
            
        binaryCount = 59
    


        }
        
        

        
    }
    
    
    
    func timerDone(){
        
        print("playing final sound sound")
        counter.invalidate()
        timerTime.text = (timer?.time)! + ":00"
        timerInterval.text = (timer?.interval)! + ":00"
         playSound("long")
        
        
        
        
    }
    
    func playSound(name: String?){
        
        let playURL:NSURL = NSBundle.mainBundle().URLForResource(name, withExtension: "mp3")!
        
        do { play = try AVAudioPlayer(contentsOfURL: playURL, fileTypeHint: nil) }
        catch { return }
        
        
        play.prepareToPlay()
        play.play()
        
        
        
    }
    
    
    func twit(){
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter){
            let twitterSheet:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            twitterSheet.setInitialText("Share on Twitter")
            self.presentViewController(twitterSheet, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Accounts", message: "Please login to a Twitter account to share.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    
    
}
