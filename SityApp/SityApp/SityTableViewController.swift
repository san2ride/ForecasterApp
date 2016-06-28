//
//  SityTableViewController.swift
//  SityApp
//
//  Created by don't touch me on 6/28/16.
//  Copyright © 2016 trvl, LLC. All rights reserved.
//

import UIKit

class SityTableViewController: UITableViewController {

    var citysArray = [City]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

       

    }
    
    @IBAction func addButton(sender: AnyObject) {
        
        
        let c = City()
        c.zipcode = "Park City, 84068"
        self.citysArray.append(c)
        
        self.tableView.reloadData()
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.citysArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        let c = self.citysArray[indexPath.row]
        
        cell.textLabel?.text = c.zipcode
        
        return cell
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        
    }
    
    
    
    
}
