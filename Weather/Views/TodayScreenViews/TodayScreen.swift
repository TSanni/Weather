//
//  TodayScreen.swift
//  Weather
//
//  Created by Tomas Sanni on 5/29/23.
//

import SwiftUI

struct TodayScreen: View {
    @EnvironmentObject var vm: WeatherKitManager
    var body: some View {
        GeometryReader { geo in
            ScrollView(showsIndicators: false) {
                ZStack {
                    Color(red: 0.558, green: 0.376, blue: 0.999)
                    VStack(alignment: .leading, spacing: 0.0) {

                        VStack {
                            immediateTempDetails
                            
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                WeatherGraphView(graphColor: Color(red: 0.558, green: 0.376, blue: 0.999))
                                    .frame(width: geo.size.width * 1.5)
                                    .padding()
                                    .offset(x: -30)
                            }
                            
                            precipitationPrediction
                                .offset(x: 10)
                                .padding(.bottom)

                        }
                        .frame(height: geo.size.height * 0.99)

                        CurrentDetailsView()
                        
                        CustomDivider()
                        
                        WindView()
                        
                        CustomDivider()
                        
                        SunsetSunriseView()
                        
                        CustomDivider()
                        
                    }
                }
            }
        }
    }
    
    
    
    
    var immediateTempDetails: some View {
        VStack(alignment: .leading, spacing: 15.0) {
            Text("May 29, 10:50 PM")
                .foregroundColor(.black)
                .shadow(color: .white.opacity(0.3), radius: 1, y: 1.7)
            Text("Day 86°↑ · Night 68°↓")
                .shadow(color: .black.opacity(0.5), radius: 1, y: 1.7)

            HStack(spacing: 0) {
                Text("77")
                    .font(.system(size: 100))
                    .shadow(color: .black.opacity(0.5), radius: 1, y: 1.7)

                Text("°F")
                    .font(.system(size: 75))
                    .shadow(color: .black.opacity(0.5), radius: 1, y: 1.7)

                Spacer()
                Image(systemName: "cloud")
                    .font(.system(size: 100))
                    .shadow(color: .black.opacity(0.5), radius: 1, y: 1.7)

            }
            HStack {
                Text("Feels like 77°")
                Spacer()
                Text("Partly cloudy")
            }
            .shadow(color: .black.opacity(0.5), radius: 1, y: 1.7)

            Spacer()
            
            
        }
        .foregroundColor(.white)
        .padding()

    }
    
    var precipitationPrediction: some View  {
        HStack {
            Image(systemName: "umbrella")
            Text("717% chance of precipitation tonight")
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundColor(.white)
        .shadow(color: .black.opacity(0.5), radius: 1, y: 1.7)
        .padding()
    }
    
}

struct TodayScreen_Previews: PreviewProvider {
    static var previews: some View {
        TodayScreen()
    }
}


