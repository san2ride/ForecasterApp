//
//  WeatherViewController.swift
//  SityApp
//
//  Created by don't touch me on 6/29/16.
//  Copyright © 2016 trvl, LLC. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var zipLabel: UILabel!
    
    
    var theCity: City?

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        
        if let sity = self.theCity {
            
            self.cityLabel?.text = sity.name
            self.zipLabel?.text = sity.zipcode
            self.imageView?.image = UIImage(named: sity.imageName)
            
            
        }
        
        
    }
    
    
    
    
    
    
}
