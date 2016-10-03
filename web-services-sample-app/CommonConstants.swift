//
//  CommonConstants.swift
//  web-services-sample-app
//
//  Created by webonise on 30/09/16.
//  Copyright © 2016 webonise. All rights reserved.
//

class CommonConstants {
    struct StoryboardID {
        static let SHOW_WEATHER_STORYBOARD_ID = "ShowWeatherVC"
    }
    struct AlertField {
        static let ALERT_TITLE = "Alert"
        static let ALERT_MESSAGE = "Enter proper City name"
        static let ACTION_TITLE = "OK"
    }
    struct WebServices {
        static let APPID_VALUE = "82d42d1bbaa0bbec840a96ca44a1660d"
        static let URL = "http://api.openweathermap.org/data/2.5/weather?q="
        static let GET_REQUEST = "GET"
        static let AND = "&"
        static let APPID = "appid="
    }
    struct DictionaryKey {
        static let COORDINATES = "coord"
        static let WEATHER_DETAILS_MAIN = "main"
        static let LATITUDE = "lat"
        static let LONGITUDE = "lon"
        static let TEMP_MAX = "temp_max"
        static let TEMP_MIN = "temp_min"
    }
    
}
