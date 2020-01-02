//
//  OpenWeatherMapServiceMapper.swift
//  WeatherService
//
//  Created by Mrigank Sahai on 5/18/18.
//  Copyright © 2019 mriganksahai. All rights reserved.
//

import Foundation
import CoreLocation

/// Maps responses from OpenWeatherMap to WeatherService.
struct OpenWeatherMapServiceMapper {
    
    func map(response: OpenWeatherMapResponse) -> Weather? {
        guard let tempValue = response.main?.temp else {
            return nil
        }

        guard let coords = response.coord else {
            return nil
        }

        let location = CLLocationCoordinate2D(latitude: coords.lat, longitude: coords.lon)
        let tempMeausrement = Measurement(value: tempValue, unit: UnitTemperature.kelvin)
        let temperature = Temperature(value: tempMeausrement)
        let weather = Weather(location: location, temperature: temperature)

        return weather
    }
}
