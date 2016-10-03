//
//  ViewController.swift
//  web-services-sample-app
//
//  Created by webonise on 29/09/16.
//  Copyright © 2016 webonise. All rights reserved.
//

import UIKit

class GetWeatherVC: UIViewController {
    
    @IBOutlet var textFieldEnterCityName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    /// This function checks for validations whether the user has added only whitespaces in the text field
    ///  - returns: false if the user has entered only whitespaces and no string else returns true
    func isValidCityName(enteredCityName: NSString) -> Bool {
        if(enteredCityName.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()).characters.count == 0)
        {
            return false
        }
        else
        {
            return true
        }
    }
    
    /// This function checks for validations whether the user has added only whitespaces in the text field
    ///- returns: Void
    func checkValidation() -> Void {
        //here if condition checks for the valid city name entered by the user and if invalid city name is entered an alert is prompted on the screen
        if(!(self.isValidCityName(textFieldEnterCityName.text!)))
        {
            textFieldEnterCityName.becomeFirstResponder()
            let alert = UIAlertController(title: CommonConstants.AlertViewConstants.ALERT_TITLE, message: CommonConstants.AlertViewConstants.ALERT_MESSAGE, preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: CommonConstants.AlertViewConstants.ACTION_TITLE, style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        else
        {
            //if the entered city name is valid the user can press get weather and navigate to other screen to view the weather details
            if let showWeatherVC = storyboard!.instantiateViewControllerWithIdentifier(CommonConstants.StoryboardID.SHOW_WEATHER_STORYBOARD_ID) as? ShowWeatherVC {
                showWeatherVC.enteredCityName = textFieldEnterCityName.text!
                self.navigationController!.pushViewController(showWeatherVC, animated: true)
            }
            self.clearTextFields()
        }
    }
    
    /// Function clears text field upon calling. 
    /// Empties the text field upon calling
    ///- returns: Void
    func clearTextFields() -> Void {
        textFieldEnterCityName.text = ""
    }
    
    /// It performs action when getWeatherButtonTapped button is pressed. Calls checkValidation method
    ///- parameter: sender ID of getWeatherButtonTapped button
   @IBAction func getWeatherButtonTapped(sender: AnyObject) {
        self.checkValidation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

