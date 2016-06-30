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
    
    let apiController = APIController ()
    var theCity: City?

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        if let city = self.theCity {
            
            self.cityLabel.text = city.name
            self.zipLabel.text = city.zipcode
            self.imageView.image = UIImage(named: city.imageName)
            
        
            let latlong = "\(city.latitude)" + "," + "\(city.longitude)"
        
            self.apiController.fetchWeather(latlong)
        }
        
    }
    
}
