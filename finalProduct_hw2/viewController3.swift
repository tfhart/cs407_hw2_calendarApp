//
//  viewController3.swift
//  finalProduct_hw2
//
//  Created by Tommy Hart on 10/26/15.
//  Copyright © 2015 Tommy Hart. All rights reserved.
//

import Foundation
import UIKit

class viewController3: UIViewController
{
    
    @IBOutlet weak var EventName: UITextField! = UITextField()
    @IBOutlet weak var NotesSpace: UITextView! = UITextView()
    
    var eventData:NSDictionary = NSDictionary()
    var index = 0;
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        EventName?.userInteractionEnabled = false
        NotesSpace?.userInteractionEnabled = false
        
        EventName?.text = eventData.objectForKey("event") as? String
        NotesSpace?.text = eventData.objectForKey("notes") as? String
    }
    
    @IBAction func Delete(sender: AnyObject)
    {
        
        let userDefault:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        let eventListArray:NSMutableArray! = userDefault.objectForKey("eventList") as? NSMutableArray
        let newList:NSMutableArray = NSMutableArray()
        
        for i:AnyObject in eventListArray!
        {
            newList.addObject(i as! NSDictionary)
        }
        
        newList.removeObject(eventData)
        userDefault.removeObjectForKey("eventList")
        userDefault.setObject(newList, forKey: "eventList")
        userDefault.synchronize()
        self.navigationController?.popToRootViewControllerAnimated(true) 
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}