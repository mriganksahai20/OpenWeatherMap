//
//  OpenWeatherMapOperation+Extensions.swift
//  WeatherService
//
//  Created by Mrigank Sahai on 5/26/18.
//  Copyright © 2019 mriganksahai. All rights reserved.
//

import Foundation
import CoreLocation

extension OpenWeatherMapOperation {
    
    init(locationCoordinate: CLLocationCoordinate2D) {
        self = .getCurrentByGeographic(lat: locationCoordinate.latitude, lon: locationCoordinate.longitude)
    }
}
