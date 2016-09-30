//
//  File.swift
//  web-services-sample-app
//
//  Created by webonise on 30/09/16.
//  Copyright © 2016 webonise. All rights reserved.
//

import Foundation

class Weather {
    var latitude: String?
    var longitude: String?
    var max_temperature: String?
    var min_temperature: String?
    
    init()
    {
        latitude = ""
        longitude = ""
        max_temperature = ""
        min_temperature = ""
    }
}