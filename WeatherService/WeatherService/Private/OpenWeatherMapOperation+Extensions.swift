//
//  OpenWeatherMapOperation+Extensions.swift
//  WeatherService
//
//  Created by David Messing on 5/26/18.
//  Copyright © 2018 davemess. All rights reserved.
//

import Foundation
import CoreLocation

extension OpenWeatherMapOperation {
    
    init(locationCoordinate: CLLocationCoordinate2D) {
        self = .getCurrentByGeographic(lat: locationCoordinate.latitude, lon: locationCoordinate.longitude)
    }
}
