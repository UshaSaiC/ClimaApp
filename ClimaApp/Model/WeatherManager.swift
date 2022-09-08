//
//  WeatherManager.swift
//  ClimaApp
//
//  Created by Usha Sai Chintha on 08/09/22.
//

import Foundation

struct WeatherManager{
    // below url throws error if we use http encoding.. so alternate safe option is to make it https
    // Apple throws error when we are trying to access unsafe sites
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=3c5773b4ba92c84d23b0e2f98b0e5418&units=metric"
    
    func fetchWeather(cityName: String){
        let url = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: url)
    }
    
    func performRequest(urlString: String){
        
        // Step : 1 - Create a URL
        if let url = URL(string: urlString){
            
            // Step : 2 - Create a URLSession
            let session = URLSession(configuration: .default)
            
            // Step : 3 - Give URLSession a task
            // task might take time (i.e hitting url and getting data)... so we dont want to wait until the task s done as there are other things the app should handle. So, we have completion handler
            // we aren't passing any values for handler because once the session is triggered, if the task has any data or response or error... all those would be automatically passed to completion handler
            let task = session.dataTask(with: url, completionHandler: handle(data:response:error:))
            
            // Step : 4 - Start the task
            // tasks can be in suspended state or when they are initialized they would be in suspended state... so start tasks we use resume method
            task.resume()
        }
        
        print(urlString)
    }
    
    func handle(data: Data?, response: URLResponse?, error: Error?) -> Void{
        if error != nil{
            print(error!)
            // return without any value basically means exit function
            return
        }
        
        if let safeData = data{
            
            // encoding for most of the data sent by web is gonna be utf8 standard
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString)
        }
        
    }
}
