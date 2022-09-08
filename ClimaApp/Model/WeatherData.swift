//
//  WeatherData.swift
//  ClimaApp
//
//  Created by Usha Sai Chintha on 08/09/22.
//

import Foundation

struct WeatherData: Codable{
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable{
    let temp: Double
}

struct Weather: Codable{
    let description: String
    let id: Int
}
