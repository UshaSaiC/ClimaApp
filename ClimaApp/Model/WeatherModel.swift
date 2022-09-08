//
//  WeatherModel.swift
//  ClimaApp
//
//  Created by Usha Sai Chintha on 08/09/22.
//

import Foundation

struct WeatherModel{
    // stored properties as below lines of code help in storing a piece of data
    let conditionId: Int
    let cityName: String
    let temperature: Double
    
    // computed property : the values of these properties are computed during run time based on conditions
    // computed properties should always be a var as its value is gonna be changed based on computation
    var conditionName: String {
        switch conditionId{
        case 200...232: return "cloud.bolt"
        case 300...321: return "cloud.drizzle"
        case 500...531: return "cloud.rain"
        case 600...622: return "cloud.snow"
        case 701...781: return "cloud.fog"
        case 800: return "sun.max"
        case 801...804: return "cloud.bolt"
        default: return "cloud"
        }
    }
    
    var temperatureString: String{
        String(format: "%.1f", temperature)
    }
    
    func getConditionName(weatherId: Int) -> String {
        switch weatherId{
        case 200...232: return "cloud.bolt"
        case 300...321: return "cloud.drizzle"
        case 500...531: return "cloud.rain"
        case 600...622: return "cloud.snow"
        case 701...781: return "cloud.fog"
        case 800: return "sun.max"
        case 801...804: return "cloud.bolt"
        default: return "cloud"
        }
        
    }

}
