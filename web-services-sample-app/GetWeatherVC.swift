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

    /** This function checks for validations whether the user has added only whitespaces in the text field
     * \returns Nothing
     */
    func isValid(isValidString: NSString) -> Bool {
        if(isValidString.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()).characters.count == 0)
        {
            return false
        }
        else
        {
            return true
        }
    }
    
    /** This function checks for validations whether the user has added only whitespaces in the text field
     * \returns Nothing
     */
    func checkValidation() -> Void {
        if(!(self.isValid(textFieldEnterCityName.text!)))
        {
            textFieldEnterCityName.becomeFirstResponder()
            let alert = UIAlertController(title: CommonConstants.AlertField.ALERT_TITLE, message: CommonConstants.AlertField.ALERT_MESSAGE, preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: CommonConstants.AlertField.ACTION_TITLE, style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        else
        {
            if let showWeatherVC = storyboard!.instantiateViewControllerWithIdentifier(CommonConstants.StoryboardID.SHOW_WEATHER_STORYBOARD_ID) as? ShowWeatherVC {
                showWeatherVC.enteredCityName = textFieldEnterCityName.text!
                self.navigationController!.pushViewController(showWeatherVC, animated: true)
        }
            self.clearTextFields()
        }
    }
    
    /** Function clears text field upon calling
     * \returns Returns nothing
     */
    func clearTextFields() -> Void {
        textFieldEnterCityName.text = ""
    }
    
    /** It performs action when getWeatherButtonTapped button is pressed. Calls checkValidation method
     * \param sender ID of getWeatherButtonTapped button
     */
   @IBAction func getWeatherButtonTapped(sender: AnyObject) {
        self.checkValidation()
    }
    
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

