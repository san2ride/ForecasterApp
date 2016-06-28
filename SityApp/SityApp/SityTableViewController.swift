//
//  SityTableViewController.swift
//  SityApp
//
//  Created by don't touch me on 6/28/16.
//  Copyright © 2016 trvl, LLC. All rights reserved.
//

import UIKit
import CoreLocation

class SityTableViewController: UITableViewController {

    var citysArray = [City]()
    var currentCity: City?
    
    override func viewDidLoad() {
        super.viewDidLoad()

       

    }
    
    @IBAction func addButton(sender: AnyObject) {
        
        let alert = UIAlertController(title: "Add Name", message: "Add a new name", preferredStyle: .Alert)
        
        // Create an action called "Save"
        
        let saveAction = UIAlertAction(title: "Save",
                                       style: .Default,
                                       handler: {
                                        (action) in
                                        
                                        self.currentCity = City()
                                        
                                        if let textField = alert.textFields?.first {
                                            
                                            if let name = textField.text {
                                                print(name)
                                                
                                                self.currentCity?.name = name
                                            }
                                        }
                                        
                                        if let zipTextField = alert.textFields? [1] {
                                            
                                            if let zipcode = zipTextField.text {
                                                   print(zipcode)
                                                
                                                self.currentCity?.zipcode = zipcode
                                                
                                               
                                                self.geocoding(zipcode, completion: {
                                                    (latitude, longitude) in
                                                    
                                                    self.currentCity?.latitude = latitude
                                                    self.currentCity?.longitude = longitude
                                                    
                                                    print(latitude)
                                                    print(longitude)
                                                    
                                                    if let current = self.currentCity {
                                                        self.citysArray.append(current)
                                                    }
                                                    
                                                
                                                })
                                            
                                                
                                            }
                                        }
                                        
                                        
                                        
        })
        
        // Add the action to the alert instance
        alert.addAction(saveAction)
        
        // Create an action called Cancel
        
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .Default) {
                                            (action) in
                                            
        }
        
        // Add the cancel action
        alert.addAction(cancelAction)
        
        
        // Add a textfield to the AlertController
        
        alert.addTextFieldWithConfigurationHandler {
            (textField) in
            
            // configure the placeholder text
            textField.placeholder = "Please enter your name"
        }
        
        // Present the alert using presentViewController
        self.presentViewController(alert, animated: true, completion: nil)
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
    
    func geocoding(location: String, completion: (Double, Double) -> ()) {
        CLGeocoder().geocodeAddressString(location) {
            
            (placemarks, error) in
            
            if placemarks?.count > 0 {
                let placemark = placemarks?[0]
                let location = placemark!.location
                let coordinate = location?.coordinate
                completion((coordinate?.latitude)!, (coordinate?.longitude)!)
            }
        }
    }

    
    
    
}