//: Playground - noun: a place where people can play

import Foundation
import PlaygroundSupport
import CoreLocation
import WeatherService

PlaygroundPage.current.needsIndefiniteExecution = true

let weatherService = WeatherService(apiKey: Keys.appId)

// Get weather at location
let location = CLLocationCoordinate2D(latitude: 30.275755, longitude: -97.739607)
weatherService.getWeather(at: location, success: { (weather) in
    if let temperature = weather.temperature {
        let formatter = MeasurementFormatter()
        let temp = formatter.string(from: temperature.value)
        
        print(temp)
    }
}) { (error) in
    print(error)
}

// Get weather at city
weatherService.getWeather(for: "London", success: { (weather) in
    if let temperature = weather.temperature {
    let formatter = MeasurementFormatter()
    let temp = formatter.string(from: temperature.value)
    
    print(temp)
    }
}) { (error) in
    print(error)
}

// Get weather at city id
weatherService.getWeather(for: "2172797", success: { (weather) in
    if let temperature = weather.temperature {
        let formatter = MeasurementFormatter()
        let temp = formatter.string(from: temperature.value)
        
        print(temp)
    }
}) { (error) in
    print(error)
}

// Get weather at zip
weatherService.getWeather(for: "London", success: { (weather) in
    if let temperature = weather.temperature {
        let formatter = MeasurementFormatter()
        let temp = formatter.string(from: temperature.value)
        
        print(temp)
    }
}) { (error) in
    print(error)
}
