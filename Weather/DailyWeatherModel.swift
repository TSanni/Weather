//
//  DailyWeatherModel.swift
//  Weather
//
//  Created by Tomas Sanni on 6/10/23.
//

import Foundation


//MARK: - Main Model for Daily Weather
/// Daily Weather Model - Includes properties for daily weather to be used with WeatherKit
struct DailyWeatherModel: Identifiable {
    let id = UUID()
    
    let date: String
    let dailyWeatherDescription: String
    let dailyChanceOfPrecipitation: String // Will be used twice in daily view
    let dailySymbol: String
    let dailyLowTemp: String
    let dailyHighTemp: String
    
    let dailyWind: WindData
    let dailyUVIndex: String
    let sunEvents: SunData
    
    
    /// Holder data for daily weather
    static let dailyDataHolder = DailyWeatherModel(
        date: "-",
        dailyWeatherDescription: "-",
        dailyChanceOfPrecipitation: "-",
        dailySymbol: "-",
        dailyLowTemp: "-",
        dailyHighTemp: "-",
        dailyWind: WindData.windDataHolder,
        dailyUVIndex: "-", sunEvents: SunData.sunDataHolder
    )
    

}


//MARK: - Sun Data Model: Will be used in multiple models
struct SunData {
    let sunrise: String
    let sunset: String
    let dawn: String
    let solarNoon: String
    let dusk: String
    
    
    /// Holder data for Sun data
    static let sunDataHolder = SunData(sunrise: "-", sunset: "-", dawn: "-", solarNoon: "-", dusk: "-")
}
