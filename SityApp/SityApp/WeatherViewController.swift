//
//  WeatherViewController.swift
//  SityApp
//
//  Created by don't touch me on 6/29/16.
//  Copyright © 2016 trvl, LLC. All rights reserved.
//

import UIKit

protocol WeatherDeleagate: class {
    func passWeather(theWeather: Weather)
}

class WeatherViewController: UIViewController, WeatherDeleagate {
    
   
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    
    let apiController = APIController ()
    var theCity: City?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.apiController.delegate = self
    }
    
    func passWeather(theWeather: Weather) {
        
        self.cityLabel.text = theCity?.name
        
        let temp = Int(theWeather.temperature)
        
        self.tempLabel.text = "\(temp)"
        self.summaryLabel.text = theWeather.summary
        self.imageView.image = UIImage(named: theWeather.icon)
        
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        if let city = self.theCity {
            
            self.cityLabel.text = city.name
            
            
            
        
            let latlong = "\(city.latitude)" + "," + "\(city.longitude)"
        
            self.apiController.fetchWeather(latlong)
        }
        
    }
    
}
