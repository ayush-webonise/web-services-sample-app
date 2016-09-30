//
//  ShowWeatherVC.swift
//  web-services-sample-app
//
//  Created by webonise on 29/09/16.
//  Copyright © 2016 webonise. All rights reserved.
//

import Foundation
import UIKit

class ShowWeatherVC: UIViewController {
    
    @IBOutlet var textFieldLatitude: UITextField!
    @IBOutlet var textFieldLongitude: UITextField!
    @IBOutlet var textFieldMaxTemperature: UITextField!
    @IBOutlet var textFieldMinTemperature: UITextField!
    var enteredCityName: String?
    var weather: Weather = Weather()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        self.webServicesRequest()
    }
    
    /** This function call api and converts the data of json format into NSDictionary
     * \param None
     * \returns Nothing
     */
    func webServicesRequest() -> Void {
        let scriptUrl = CommonConstants.WebServices.URL
        let urlWithParams = scriptUrl + "cityName=\(enteredCityName)&appid=\(CommonConstants.WebServices.APPID)"
        let myUrl = NSURL(string: urlWithParams.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!)
        let request = NSMutableURLRequest(URL:myUrl!);
        request.HTTPMethod = CommonConstants.WebServices.GET_REQUEST
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            data, response, error in
            if error != nil
            {
                print("error=\(error)")
                return
            }
            let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print("responseString = \(responseString)")
            do {
                    if let convertedJsonIntoDict = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as? NSDictionary
                    {
                        print(convertedJsonIntoDict)
                        self.parseDictionary(convertedJsonIntoDict)
                    }
                }
                
             catch let error as NSError {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
   
    /** This function stores value of specific key in separate variables
     * \param dict of NSDictionary type
     * \returns Nothing
     */
    func parseDictionary(dict: NSDictionary) -> Void {
        if let latitude = dict[CommonConstants.DictionaryKey.COORDINATES]?[CommonConstants.DictionaryKey.LATITUDE] as? Float {
            weather.latitude = String(latitude)
        }
        if let longitude = dict[CommonConstants.DictionaryKey.COORDINATES]?[CommonConstants.DictionaryKey.LONGITUDE] as? Float {
            weather.longitude = String(longitude)
        }
        if let temp_max = dict[CommonConstants.DictionaryKey.WEATHER_DETAILS_MAIN]?[CommonConstants.DictionaryKey.TEMP_MAX] as? Float {
            weather.max_temperature = String(self.convertToCelsius(temp_max))
        }
        if let temp_min = dict[CommonConstants.DictionaryKey.WEATHER_DETAILS_MAIN]?[CommonConstants.DictionaryKey.TEMP_MIN] as? Float {
            weather.min_temperature = String(self.convertToCelsius(temp_min))
        }
            self.displayWeatherDetails()
    }
    
    /** This function converts the temperature from fahrenheit to degree celsius
     * \param temperature of Float type
     * \returns convertedTemperature
     */
    func convertToCelsius(temperature: Float) -> Float {
        let convertedTemperature = ((temperature - 32)/1.8)
        return convertedTemperature
    }
    
    /** This function populates the textfields and displays information
     * \param None
     * \returns Nothing
     */
    func displayWeatherDetails() -> Void {
        dispatch_async(dispatch_get_main_queue()){
            self.textFieldLatitude.text = self.weather.latitude
            self.textFieldLongitude.text = self.weather.longitude
            self.textFieldMaxTemperature.text = self.weather.max_temperature
            self.textFieldMinTemperature.text = self.weather.min_temperature
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
