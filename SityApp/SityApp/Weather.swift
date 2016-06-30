//
//  Weather.swift
//  SityApp
//
//  Created by don't touch me on 6/29/16.
//  Copyright © 2016 trvl, LLC. All rights reserved.
//

import UIKit

class Weather: NSObject {
    
    
    var summary: String = ""
    var icon: String = ""
    var precipProbability: Double = 0.0
    var temperature: Double = 0.0
    var humidity: Double = 0.0
    var windSpeed: Double = 0.0
    
    
    init(dict: JSONDictionary) {
        
        super.init()
        
        
        
        if let summary = dict["summary"] as? String {
            self.summary = summary
        } else {
            print("I could not parse the summary")
        }
        
        if let icon = dict["icon"] as? String {
            self.icon = icon
        } else {
            print("I could not parse the icon")
        }

        if let precipProbability = dict["precipProbability"] as? Double {
            self.precipProbability = precipProbability
        } else {
            print("I could not parse the precipProbability")
        }
        
        if let temperature = dict["temperature"] as? Double {
            self.temperature = temperature
        } else {
            print("I could not parse the temperature")
        }
        
        if let humidity = dict["humidity"] as? Double {
            self.humidity = humidity
        } else {
            print("I could not parse the humidity")
        }
        
        if let windSpeed = dict["windSpeed"] as? Double {
            self.windSpeed = windSpeed
        } else {
            print("I could not parse the windSpeed")
        }
    }
}
