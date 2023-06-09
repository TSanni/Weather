//
//  WindView.swift
//  Weather
//
//  Created by Tomas Sanni on 6/3/23.
//

import SwiftUI

struct WindView: View {
    @Environment(\.colorScheme) var colorScheme
//    @EnvironmentObject var vm: WeatherKitManager
    let windData: WindData
    let hourlyWindData: [WindData]
    let setTodayWeather: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Wind")
                .bold()
                .padding(.bottom)
            
            if setTodayWeather {
                todayData
            } else {
                tomorrowData
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                WindBarGraph(hourlyWind: hourlyWindData)
                    .frame(width: UIScreen.main.bounds.width * 2)
                    .saturation(2)
            }
            
        }
        .padding()
        .padding(.top)
        .background(colorScheme == .light ? K.Colors.goodLightTheme : K.Colors.goodDarkTheme)

    }
    
    
    
    var todayData: some View {
        HStack(spacing: 30.0) {
            HStack {
                Text(windData.windSpeed)
                    .bold()
                    .font(.system(size: 70))
                    .foregroundColor(windData.windColor)
                
                VStack {
                    Image(systemName: "location.fill")
//                        .rotationEffect(.degrees(vm.getRotation(direction: windData.windDirection) + 180))
                        .rotationEffect(.degrees(WeatherManager.shared.getRotation(direction: windData.windDirection) + 180) )
                    Text(windData.speedUnit)
                }
                .foregroundColor(.secondary)
            }
            
            
            
            VStack(alignment: .leading) {
                Text(windData.windDescriptionForMPH)
                    .font(.largeTitle)
                    .fontWeight(.light)
                    .lineLimit(1)
                    .minimumScaleFactor(0.7)
                Text("Now · From \(windData.readableWindDirection)").foregroundColor(.secondary)
                    .lineLimit(1)
                    .minimumScaleFactor(0.8)


            }
        }
    }
    
    var tomorrowData: some View {
        VStack(alignment: .leading, spacing: 5.0) {
            Text(windData.windDescriptionForMPH)
                .fontWeight(.light)
                .font(.title)
            Text("Average of about \(windData.windSpeed) \(windData.speedUnit)")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }
}

struct WindView_Previews: PreviewProvider {
    static var previews: some View {
        WindView(windData: WindData.windDataHolder, hourlyWindData: [WindData.windDataHolder], setTodayWeather: false)
            .previewDevice("iPhone 12 Pro Max")
//            .environmentObject(WeatherKitManager())
        
    }
}
