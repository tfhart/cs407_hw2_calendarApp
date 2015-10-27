//
//  viewController2.swift
//  finalProduct_hw2
//
//  Created by Tommy Hart on 10/26/15.
//  Copyright © 2015 Tommy Hart. All rights reserved.
//

import Foundation
import UIKit

class viewController2: UIViewController
{
    
    @IBOutlet weak var EventTitle: UITextField! = UITextField()
    @IBOutlet weak var EventDescription: UITextView! = UITextView()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func SaveButton(sender: AnyObject) {
        let userDefaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        var eventList:NSMutableArray! = userDefaults.objectForKey("eventList") as? NSMutableArray
        let dataSet:NSMutableDictionary = NSMutableDictionary()
        dataSet.setObject(EventTitle.text!,forKey: "event")
        dataSet.setObject(EventDescription.text!,forKey: "notes")
        
        if ((eventList) != nil)
        {
            let newList:NSMutableArray = NSMutableArray();
            for i:AnyObject in eventList!
            {
                newList.addObject(i as! NSDictionary)
            }
            userDefaults.removeObjectForKey("eventList")
            newList.addObject(dataSet)
            userDefaults.setObject(newList,forKey: "eventList")
        }
        else
        {
            userDefaults.removeObjectForKey("eventList")
            eventList = NSMutableArray()
            eventList!.addObject(dataSet)
            userDefaults.setObject(eventList,forKey: "eventList")
        }
        
        userDefaults.synchronize()
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
}