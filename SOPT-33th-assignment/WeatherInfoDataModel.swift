//
//  WeatherInfoDataModel.swift
//  SOPT-33th-assignment
//
//  Created by 이자민 on 2023/11/14.
//

import Foundation

// MARK: - WeatherInfoDataModel
struct WeatherInfoDataModel: Codable {
    let weather: [Weather]
    let main: Main
    let timezone: Int
    let name: String
}

// MARK: - Main
struct Main: Codable {
    let temp, tempMin, tempMax: Double

    enum CodingKeys: String, CodingKey {
        case temp
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
}


// MARK: - Weather
struct Weather: Codable {
    let description: String
}
