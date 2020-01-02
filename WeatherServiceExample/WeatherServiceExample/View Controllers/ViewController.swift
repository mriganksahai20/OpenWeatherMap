//
//  ViewController.swift
//  WeatherServiceExample
//
//  Created by Mrigank Sahai on 5/18/18.
//  Copyright © 2019 mriganksahai. All rights reserved.
//

import UIKit
import WeatherService
import CoreLocation
import Alamofire

class ViewController: UIViewController {
    
    private enum State {
        case loading
        case loaded
    }
    
    @IBOutlet weak var resultsView: UIStackView!
    @IBOutlet weak var activityView: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    
    var windSpeed: String?
    
    private let weatherService = WeatherService(apiKey: Constants.APIKey.apiKey)
    
    private var coordinate: CLLocationCoordinate2D {
        // Gurgaon Haryana
        return CLLocationCoordinate2D(latitude: 28.4595, longitude: 77.0266)
    }
    
    private lazy var dateFormatter: DateFormatter = {
        var formatter = DateFormatter()
        formatter.timeStyle = .long
        return formatter
    }()
    
    private lazy var temperatureFormatter: MeasurementFormatter = {
        var formatter =  MeasurementFormatter()
        return formatter
    }()
    
    private var state: State = .loading {
        didSet {
            reloadView(for: state)
        }
    }
    
    // MARK: - view lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reloadData()
        getWindSpeed()
    }
    
    // MARK: - view
    
    private func reloadView(for state: State) {
        switch state {
        case .loading:
            resultsView.isHidden = true
            activityView.isHidden = false
        case .loaded:
            resultsView.isHidden = false
            activityView.isHidden = true
        }
    }
    
    // MARK: - actions
    
    @IBAction func refreshButtonPressed(_ sender: Any) {
        reloadData()
    }
    
    // MARK: - data
    
    private func reloadData() {
        reloadView(for: .loading)
        
        weatherService.getCurrentWeather(at: coordinate, success: { (weather) in
            self.dateLabel.text = "Date: " +  self.dateFormatter.string(from: Date())
            self.locationLabel.text = "Location: " + self.coordinate.description
            if let value = weather.temperature?.value {
                self.temperatureLabel.text = "Temperature: " + self.temperatureFormatter.string(from: value)
            }
            
            self.reloadView(for: .loaded)
        }) { (error) in
            self.dateLabel.text = "Date: " + self.dateFormatter.string(from: Date())
            self.locationLabel.text = "Location: " + NSLocalizedString("Error", comment: "")
            self.temperatureLabel.text = "Temperature: " + error.localizedDescription
            
            self.reloadView(for: .loaded)
        }
    }
    
    
    
    private func getWindSpeed(){
        Alamofire.request(Constants.URL.url, method: .get, parameters:nil, encoding: JSONEncoding.default, headers: nil)
            .responseJSON{ response in
                if response.result.value != nil{
                    
                    let  jsonResult = (try! JSONSerialization.jsonObject(with: response.data!, options: JSONSerialization.ReadingOptions.mutableContainers)) as! NSDictionary
                    
                    self.windSpeed  = String(describing:((jsonResult.value(forKey: "wind")as! NSDictionary)).value(forKey: "speed")!)
                    self.windLabel.text = "Wind Speed " + (self.windSpeed ?? "")
                }
                
        }
    }
}

extension CLLocationCoordinate2D: CustomStringConvertible {
    
    public var description: String {
        return String(format: "%@, %@", latitude.description, longitude.description)
    }
}
