//
//  OpenWeatherMapServiceURLRequestBuilder.swift
//  WeatherService
//
//  Created by David Messing on 5/18/18.
//  Copyright © 2018 davemess. All rights reserved.
//

import Foundation

/// Constructs a url request from an OpenWeatherMapOperation.
class OpenWeatherMapServiceURLRequestBuilder {
    
    private let urlBuilder: OpenWeatherMapServiceURLBuilder
    
    // MARK: - lifecycle
    
    init(urlBuilder: OpenWeatherMapServiceURLBuilder) {
        self.urlBuilder = urlBuilder
    }
    
    // MARK: - internal
    
    func build(for operation: OpenWeatherMapOperation) -> URLRequest? {
        guard let url = urlBuilder.build(for: operation) else {
            return nil
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        return request
    }
}
