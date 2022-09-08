//
//  WeatherManager.swift
//  ClimaApp
//
//  Created by Usha Sai Chintha on 08/09/22.
//

import Foundation

struct WeatherManager{
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=3c5773b4ba92c84d23b0e2f98b0e5418&units=metric"
    
    func fetchWeather(cityName: String){
        let url = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: url)
    }
    
    func performRequest(urlString: String){
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil{
                    print(error!)
                    return
                }
                
                if let safeData = data{
                    if let weather = parseJson(weatherData: safeData){
                        // though below code works, its suggested not to have it as it binds the WeatherManager struct to ViewController object
                        let weatherViewController = ViewController()
                        weatherViewController.didUpdateWeather(weather: weather)
                    }
                }
            }
            task.resume()
        }
        print(urlString)
    }
    
    func parseJson(weatherData: Data) -> WeatherModel?{
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            return weather
        } catch{
            print(error)
            return nil
        }
    }
}
