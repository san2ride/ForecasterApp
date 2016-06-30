//
//  APIController.swift
//  SityApp
//
//  Created by don't touch me on 6/29/16.
//  Copyright © 2016 trvl, LLC. All rights reserved.
//

import UIKit

class APIController: NSObject {
    
   
    let session = NSURLSession.sharedSession()
    

    
    func fetchWeather(latlong: String) {
        
        // 1. Put the URLString for the API Call
        let urlString = "https://api.forecast.io/forecast/37d72c8da9ba8a24e35d659797b902bf/\(latlong)"
        
        print(urlString)
        
        // 2. Attempt to create a valid NSURL from the string
        if let url = NSURL(string: urlString) {
            
            let task = session.dataTaskWithURL(url, completionHandler: {
                
                (data: NSData?, response: NSURLResponse?, error: NSError?) in
                
                // Step 1 of Parsing JSON Data
                
                if error != nil {
                    print(error?.localizedDescription)
                    return
                }
                
                // Step 2 Parse the Data
                if let data = data {
                    
                    
                    do {
                
                        if let jsonDictionary = try NSJSONSerialization.JSONObjectWithData(data, options: []) as? JSONDictionary {
                        
                            if let currDict = jsonDictionary["currently"] as? JSONDictionary {
                            
                                let w = Weather(dict: currDict)
                                
                                        print(w.summary)
                                        print(w.icon)
                                        print(w.precipProbability)
                                        print(w.temperature)
                                        print(w.humidity)
                                        print(w.windSpeed)
                                
                                
                                    } else {
                                        print("invalid")
                                    }

                        
                        }
                        
                        
                    } catch {
                        print("I could not parse the jsonDictionary")
                    }
                    
                } else {
                    print("We couldnt unwrap the data")
                }
                
                
                
            })
            
            task.resume()
            
            
        } else {
            print("Not a valid url")
        }
}

}
    
    




