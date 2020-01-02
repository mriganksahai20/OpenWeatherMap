# WeatherService
A Swift library for fetching content from OpenWeatherMap.

OpenWeatherMap requires an API key to access. See https://openweathermap.org/appid#get.

---

## Usage

1. Initialize your WeatherService instance:

  ```let weatherService = WeatherService(apiKey: <#API_KEY#>)```

2. Request weather at a location:

  ```
  weatherService.getWeather(at: coordinate, success: { (weather) in
        // do something with `weather`
      }) { (error) in
        // handle error
      }
  ```
  
  ---
  
  ## TODO
  - Operations
  - Configure timeout/urlsession
  - Forecast
  - Check status code
  - Document public interface
  - Versioning
  - Testing
