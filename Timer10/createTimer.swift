//
//  createTimer.swift
//  Timer10
//
//  Created by Cesar Ramirez on 1/8/16.
//  Copyright © 2016 Cesar Ramirez. All rights reserved.
//

import Foundation
import UIKit
import CoreData
import Social

class createTimer: UIViewController, UITextFieldDelegate{
    
    
     //  var pins = [Pin]()
    
    var timers = [Timer]()
    
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var timerText: UITextField!
    @IBOutlet weak var intervalText: UITextField!
    

    
    
    override func viewWillAppear(animated: Bool) {
        self.subscribeToKeyboardNotifications()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.unsubscribeFromKeyboardNotifications()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timerText.delegate = self
        timerText.keyboardType = .NumberPad
        intervalText.delegate = self
        intervalText.keyboardType = .NumberPad
    }
    

    

    
    
//    @IBAction func twitterButtonPushed(sender: UIButton) {
//        
//        goBack()
//        
////        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter){
////            let twitterSheet:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
////            twitterSheet.setInitialText("Share on Twitter")
////            self.presentViewController(twitterSheet, animated: true, completion: nil)
////        } else {
////            let alert = UIAlertController(title: "Accounts", message: "Please login to a Twitter account to share.", preferredStyle: UIAlertControllerStyle.Alert)
////            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
////            self.presentViewController(alert, animated: true, completion: nil)
////        }
//    }
    
    
    
    @IBAction func Cancel(sender: AnyObject) {
        
        goBack()
        
    }
    
    
    
    
    func goBack(){
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("timerTableViewController") as! TimerTableViewController
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
    
    
    
    @IBAction func save(sender: AnyObject) {
        
        save()
        goBack()
    }
    
    
    func save()  {
        
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        //2
        let entity =  NSEntityDescription.entityForName("Timer",
            inManagedObjectContext:managedContext)
        
        let timer = Timer(entity: entity!,
            insertIntoManagedObjectContext: managedContext)
        
        timer.setValue(titleText.text!, forKey: "title")
        timer.setValue(timerText.text!, forKey: "time")

        timer.setValue(intervalText.text!, forKey: "interval")

  
        do {
            try managedContext.save()
            //5
            timers.append(timer)
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
        
        print("done saving")
        
    }
    
    
    
  
    
    
    lazy var sharedContext: NSManagedObjectContext =  {
        return AppDelegate().managedObjectContext
    }()
    
    func saveContext() {
        
        print(timers)
        
        AppDelegate().saveContext()
        
    }
    
    
    
    
    
    
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        var result = true
        let prospectiveText = (textField.text! as NSString).stringByReplacingCharactersInRange(range, withString: string)
        
        if textField == timerText || textField == intervalText{
            if string.characters.count > 0 {
                let disallowedCharacterSet = NSCharacterSet(charactersInString: "0123456789").invertedSet
                let replacementStringIsLegal = string.rangeOfCharacterFromSet(disallowedCharacterSet) == nil
                
                let resultingStringLengthIsLegal = prospectiveText.characters.count <= 9
                
                let scanner = NSScanner(string: prospectiveText)
                let resultingTextIsNumeric = scanner.scanDecimal(nil) && scanner.atEnd
                
                result = replacementStringIsLegal &&
                    resultingStringLengthIsLegal &&
                resultingTextIsNumeric
            }
        }
        return result
    }
    
    
    
    
    
    func keyboardWillShow(notification: NSNotification) {
        self.view.frame.origin.y -= getKeyboardHeight(notification)
    }
    
    func keyboardWillHide(notification:NSNotification){
        self.view.frame.origin.y = 0
    }
    
    func getKeyboardHeight(notification: NSNotification) -> CGFloat {
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue // of CGRect
        if timerText.editing || titleText.editing || intervalText.editing{
            return 0//keyboardSize.CGRectValue().height - 40
        }
        else {
            return 0
        }
        
//        if timerText.editing || titleText.editing || intervalText.editing{
//            return keyboardSize.CGRectValue().height - 40
//        }
//        else {
//            return 0
//        }

    }
    
    
    func subscribeToKeyboardNotifications() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:" , name: UIKeyboardWillShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardDidHideNotification, object: nil)
    }
    
    func unsubscribeFromKeyboardNotifications() {
        NSNotificationCenter.defaultCenter().removeObserver(self, name:
            UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardDidHideNotification, object: nil)
    }

    
    
    
    
}