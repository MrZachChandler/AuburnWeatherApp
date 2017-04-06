//
//  ViewController.swift
//  AuburnWeather
//
//  Created by Zach Chandler on 6/12/15.
//  Copyright (c) 2015 Zach Chandler. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var Aubie: UIImageView!

    @IBOutlet weak var Humidity: UILabel!
    @IBOutlet weak var Pressure: UILabel!
    @IBOutlet weak var CityTemp: UILabel!
    @IBOutlet weak var CityNameLabel: UILabel!
    @IBOutlet weak var CityName: UITextField!
    @IBAction func GetData(sender: UIButton) {
        getWeatherData("http://api.openweathermap.org/data/2.5/weather?q=\(CityName.text)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getWeatherData("http://api.openweathermap.org/data/2.5/weather?q=Auburn")
        //Aubie Animation
        Aubie.animationImages = [ UIImage(named: "AubieCutout")!,UIImage(named: "AubieCutout2")!]
        Aubie.animationDuration = 3
        Aubie.startAnimating()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func getWeatherData(urlString: String)
    {
        let url = NSURL(string: urlString)
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!){ (data, response, error) in dispatch_async(dispatch_get_main_queue(), {self.setLabels(data)})
        }
        
        task.resume() 
    }
    func setLabels(weatherData : NSData)
    {
        var jsonError : NSError?
        
        let json = NSJSONSerialization.JSONObjectWithData(weatherData, options: nil, error: &jsonError) as NSDictionary
        
        if let name = json["name"] as? String {
            CityNameLabel.text = name
            
        }
        if let main = json["main"] as? NSDictionary{
            if let temp = main["temp"] as Double?
            {
                var temp1 = (((temp - 273.15) * 1.8000) + 32.00)/2 * 1.8 + 32
                CityTemp.text = String(format: "%.2f",  temp1)
                
                
            }
            if let humid = main["humidity"] as Double?
            {
                
                Humidity.text = String(format: "%.0f",  humid)
            }
            if var Press = main["pressure"] as Double?
            {
                Press = Press * 0.01
                Pressure.text = String(format: "%.0f",  Press)
            }
        }
    }
}

