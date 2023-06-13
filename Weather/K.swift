//
//  K.swift
//  Weather
//
//  Created by Tomas Sanni on 6/10/23.
//

import Foundation
import SwiftUI


enum WeatherIconSymbols: String {
    case sunMax = "sun.max"
    case moonStars = "moon.stars"
    case cloudSun = "cloud.sun"
    case cloudMoon = "cloud.moon"
    case cloud = "cloud"
    case cloudRain = "cloud.rain"
    case cloudSunRain = "cloud.sun.rain"
    case cloudMoonRain = "cloud.moon.rain"
    case cloudBolt = "cloud.bolt"
    case snowflake = "snowflake"
    case cloudFog = "cloud.fog"
    case sunMin = "sun.min"
    case cloudBoltRain = "cloud.bolt.rain"
    
    
    var iconColor: [Color] {
        switch self {
            case .sunMax:
                return [.yellow, .yellow, .yellow]
            case .moonStars:
                return [K.Colors.moonColor, K.Colors.offWhite, .clear]
            case .cloudSun:
                return [K.Colors.offWhite, .yellow, .clear]
            case .cloudMoon:
                return [K.Colors.offWhite, K.Colors.moonColor, .clear]
            case .cloud:
                return [K.Colors.offWhite, K.Colors.offWhite, K.Colors.offWhite]
            case .cloudRain:
                return [K.Colors.offWhite, .cyan, .clear]
            case .cloudSunRain:
                return [K.Colors.offWhite, .yellow, .cyan]
            case .cloudMoonRain:
                return [K.Colors.offWhite, K.Colors.moonColor, .cyan]
            case .cloudBolt:
                return [K.Colors.offWhite, .yellow, .clear]
            case .snowflake:
                return [K.Colors.offWhite, .clear, .clear]
            case .cloudFog:
                return [K.Colors.offWhite, .gray, .clear]
            case .sunMin:
                return [.yellow, .yellow, .yellow]
            case .cloudBoltRain:
                return [K.Colors.offWhite, .cyan, .white]
        }
    }
    
    
    
}

struct K {
    static let properBlack = Color(red: 0.15, green: 0.15, blue: 0.15)
    static let twelveHours = 12
    
    
    
    struct WeatherCondition {
        
        static let sunMax = "sun.max"
        static let moonStars = "moon.stars"
        static let cloudSun = "cloud.sun"
        static let cloudMoon = "cloud.moon"
        static let cloud = "cloud"
        static let cloudRain = "cloud.rain"
        static let cloudSunRain = "cloud.sun.rain"
        static let cloudMoonRain = "cloud.moon.rain"
        static let cloudBolt = "cloud.bolt"
        static let snowflake = "snowflake"
        static let cloudFog = "cloud.fog"
        static let sunMin = "sun.min"
        static let cloudBoltRain = "cloud.bolt.rain"
        static let cloudDrizzle = "cloud.drizzle"
        static let cloudSnow = "cloud.snow"
        static let sunrise = "sunrise"
        static let sunset = "sunset"
    }
    struct Colors {
        
        static let nighttimePurple = #colorLiteral(red: 0.5575598478, green: 0.3759173751, blue: 0.9990670085, alpha: 1)
        static let maroon = #colorLiteral(red: 0.5871755481, green: 0.3745910525, blue: 0.5551333427, alpha: 1)
        
        
        static let offWhite = Color(hue: 0.104, saturation: 0.0, brightness: 0.897)
        static let moonColor = Color(hue: 0.556, saturation: 0.128, brightness: 0.864)
        static let goodBlack = Color(red: 0.15, green: 0.15, blue: 0.15)
        static let darkBlue = Color(hue: 0.674, saturation: 0.986, brightness: 0.368)
        static let cloudyBlue = Color(red: 0.519, green: 0.644, blue: 0.785)

        static let thunderstormPurple = Color(red: 0.87, green: 0.24, blue: 0.595)
        
        static let precipitationBlue = Color(hue: 0.521, saturation: 0.946, brightness: 0.871)
    }
}