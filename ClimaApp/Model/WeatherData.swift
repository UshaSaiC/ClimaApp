//
//  WeatherData.swift
//  ClimaApp
//
//  Created by Usha Sai Chintha on 08/09/22.
//

import Foundation

// decodable means the values of its type can be decoded. For our scenarios, we need it to decode to JSON format
struct WeatherData: Decodable{
    let name: String
    let main: Main
    // [Weather] means array of weather items
    let weather: [Weather]
}

struct Main: Decodable{
    let temp: Double
}

struct Weather: Decodable{
    let description: String
}
