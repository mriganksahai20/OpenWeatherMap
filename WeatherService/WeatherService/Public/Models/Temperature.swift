//
//  Temperature.swift
//  WeatherService
//
//  Created by David Messing on 5/18/18.
//  Copyright © 2018 davemess. All rights reserved.
//

import Foundation

/// Represents the current temperature.
/// - ToDo: This should be backed by Measurement API.
public struct Temperature {
    public let value: Measurement<UnitTemperature>
}
