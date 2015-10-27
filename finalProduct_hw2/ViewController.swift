//
//  ViewController.swift
//  finalProduct_hw2
//
//  Created by Tommy Hart on 10/26/15.
//  Copyright © 2015 Tommy Hart. All rights reserved.
//

import UIKit

class viewController1: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    var ListOfEvents:NSMutableArray = NSMutableArray();
    
    override func viewDidAppear(animated: Bool)
    {
        let userDefaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        let eventListUserDefault:NSMutableArray! = userDefaults.objectForKey("eventList") as? NSMutableArray
        if (eventListUserDefault != nil)
        {
            ListOfEvents = eventListUserDefault
        }
        self.tableView.reloadData()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return ListOfEvents.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("TextCell", forIndexPath: indexPath) as UITableViewCell
        let eventItem:NSDictionary = ListOfEvents.objectAtIndex(indexPath.row) as! NSDictionary
        cell.textLabel!.text = eventItem.objectForKey("event") as? String
        
        
        return cell
    }
    
        override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
                if (segue.identifier == "ShowSpecificEvent"
            ) {
                let selectedIndexPath:NSIndexPath = self.tableView.indexPathForSelectedRow!
                let specificViewController:viewController3 = segue.destinationViewController as! viewController3
                specificViewController.eventData = ListOfEvents.objectAtIndex(selectedIndexPath.row) as! NSDictionary
                specificViewController.index = selectedIndexPath.row
        }
    }
    
    
    
}
