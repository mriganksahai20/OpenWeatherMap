//
//  WeatherService.swift
//  WeatherService
//
//  Created by Mrigank Sahai on 5/18/18.
//  Copyright © 2019 mriganksahai. All rights reserved.
//

import Foundation
import CoreLocation

public typealias WeatherServiceSuccess = (Weather) -> Void
public typealias WeatherServiceFailure = (Error) -> Void

/// Entrypoint to the WeatherService SDK.
public class WeatherService {
    
    enum WeatherServiceError: Error, LocalizedError {
        case unknown
        
        var errorDescription: String? {
            switch self {
            case .unknown:
                return NSLocalizedString("An uknown error occurred.", comment: "")
            }
        }
    }
    
    private let weatherMapService: OpenWeatherMapService
    private let mapper: OpenWeatherMapServiceMapper
    
    // MARK: - lifecycle
    
    public convenience init(apiKey: String) {
        let urlBuilder = OpenWeatherMapServiceURLBuilder(apiKey)
        let urlRequestBuilder = OpenWeatherMapServiceURLRequestBuilder(urlBuilder: urlBuilder)
        let weatherMapService = OpenWeatherMapService(urlRequestBuilder: urlRequestBuilder)
        let mapper = OpenWeatherMapServiceMapper()
        self.init(weatherMapService: weatherMapService, mapper: mapper)
    }
    
    private init(weatherMapService: OpenWeatherMapService, mapper: OpenWeatherMapServiceMapper) {
        self.weatherMapService = weatherMapService
        self.mapper = mapper
    }
    
    // MARK: - public
    
    public func getCurrentWeather(for city: String, country: String? = nil, success: @escaping WeatherServiceSuccess, failure: @escaping WeatherServiceFailure) {
        let operation: OpenWeatherMapOperation = .getCurrentByCityName(city: city, countryCode: country)
        perform(operation: operation, success: success, failure: failure)
    }
    
    public func getCurrentWeather(by cityId: String, success: @escaping WeatherServiceSuccess, failure: @escaping WeatherServiceFailure) {
        let operation: OpenWeatherMapOperation = .getCurrentByCityId(id: cityId)
        perform(operation: operation, success: success, failure: failure)
    }
    
    public func getCurrentWeather(at location: CLLocationCoordinate2D, success: @escaping WeatherServiceSuccess, failure: @escaping WeatherServiceFailure) {
        let operation: OpenWeatherMapOperation = OpenWeatherMapOperation(locationCoordinate: location)
        perform(operation: operation, success: success, failure: failure)
    }
    
    public func getCurrentWeather(for zip: Int, country: String? = nil, success: @escaping WeatherServiceSuccess, failure: @escaping WeatherServiceFailure) {
        let operation: OpenWeatherMapOperation = .getCurrentByZip(zip: zip, countryCode: country)
        perform(operation: operation, success: success, failure: failure)
    }
    
    // MARK: - private
    
    private func perform(operation: OpenWeatherMapOperation, success: @escaping WeatherServiceSuccess, failure: @escaping WeatherServiceFailure) {
        weatherMapService.perform(operation: operation) { (response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    failure(error)
                } else if let response = response, let result = self.mapper.map(response: response) {
                    success(result)
                } else {
                    failure(WeatherServiceError.unknown)
                }
            }
        }
    }
}
