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
            
            // creating a trailing closure
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil{
                    print(error!)
                    return
                }
                
                if let safeData = data{
                    // let dataString = String(data: safeData, encoding: .utf8)
                    // print(dataString)
                    
                    // data returned by stringifying is hard to read, so we need to parse the data
                    // sometimes calling function from closures throws error, in such cases we need to add self to call suggesting what to call the function. Below code changes to self.parseJson(weatherData: safeData)
                    parseJson(weatherData: safeData)
                }
            }
            task.resume()
        }
        print(urlString)
    }
    
    func parseJson(weatherData: Data){
        // JSONDecoder is used to decode JSON
        let decoder = JSONDecoder()
        
        // decode function needs data type, so we need not create object from WeatherData... we just need to add it directly as type with .self to reference or get the type
        // decode methods throws an exception i.e if something goes wrong it throws an error. SO we need to enclose it in try-catch block
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            print(decodedData.name)
            print(decodedData.main.temp)
            print(decodedData.weather[0].description)
        } catch{
            print(error)
        }
        
    }
}
