//
//  Weather.swift
//  WeatherService
//
//  Created by David Messing on 5/18/18.
//  Copyright © 2018 davemess. All rights reserved.
//

import Foundation
import CoreLocation

/// A composed model object which contains mapped weather data returned from the
/// OpenWeatherMap API. This class can be extended with new weather types.
public struct Weather {
    public let location: CLLocationCoordinate2D
    
    /// Weather can be described by multiple enviornmental phenomena. We compose
    /// a weather representation as a set of these phenomena.
    public let temperature: Temperature?
}
