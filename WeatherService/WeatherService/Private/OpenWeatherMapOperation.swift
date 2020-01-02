//
//  OpenWeatherMapOperation.swift
//  WeatherService
//
//  Created by David Messing on 5/18/18.
//  Copyright © 2018 davemess. All rights reserved.
//

import Foundation

/// Summary of OpenWeatherMap API operations.
///
/// - getCurrentByCityName: <#getCurrentByCityName description#>
/// - getCurrentByCityId: <#getCurrentByCityId description#>
/// - getCurrentByGeographic: <#getCurrentByGeographic description#>
/// - getCurrentByZip: <#getCurrentByZip description#>
enum OpenWeatherMapOperation {
    case getCurrentByCityName(city: String, countryCode: String?)
    case getCurrentByCityId(id: String)
    case getCurrentByGeographic(lat: Double, lon: Double)
    case getCurrentByZip(zip: Int, countryCode: String?)
}

