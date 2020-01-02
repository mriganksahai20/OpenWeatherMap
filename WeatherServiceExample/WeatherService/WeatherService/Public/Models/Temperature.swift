//
//  Temperature.swift
//  WeatherService
//
//  Created by Mrigank Sahai on 5/18/18.
//  Copyright © 2019 mriganksahai. All rights reserved.
//

import Foundation

/// Represents the current temperature.
/// - ToDo: This should be backed by Measurement API.
public struct Temperature {
    public let value: Measurement<UnitTemperature>
}
