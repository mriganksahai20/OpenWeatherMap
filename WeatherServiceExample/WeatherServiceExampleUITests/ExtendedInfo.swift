//
//  ExtendedInfo.swift
//  Weather
//
//  Created by Mrigank Sahai on 5/18/18.
//  Copyright © 2019 mriganksahai. All rights reserved.
//

import Foundation

enum ExtendedInfo: String {
    case sunrise, sunset, chanceOfRain, humidity, wind, feelLike, precipitation, pressure, visibility, uvIndex
    
    var stringValue: String {
        var textString = ""
        switch self {
        case .uvIndex:
            textString = "UV INDEX"
        case .chanceOfRain:
            textString = "CHANCE OF RAIN"
        case .feelLike:
            textString = "FEEL LIKE"
        default:
            textString = self.rawValue.uppercased()
        }
        return "\(textString):  "
    }
}

struct WeatherExtendedInfo {
    
    let sunriseTime: String?
    let sunsetTime: String?
    
    var chanceOfRain: Float = 0
    var humidity: Float = 0
    
    var windSpeed: Int = 0
    let windDirection: String?
    
    var feelLikeTemperature: Int = 0
    
    var precipitation: Int = 0
    var pressure: Int = 0
    
    var visibility: Float = 0
    var uvIndex: Int = 0
    
}


