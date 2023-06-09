//
//  SettingsScreen.swift
//  Weather
//
//  Created by Tomas Sanni on 6/28/23.
//

import SwiftUI

struct LabelView: View {
    var title: String
    let iconSymbol: String
    
    var body: some View {
        Label {
            Text(title)
                .lineLimit(1)
                .minimumScaleFactor(0.7)
        } icon: {
            Image(systemName: iconSymbol)
        }
        
    }
}


struct SettingsListBackgroundViewModifier: ViewModifier {
    @Environment(\.colorScheme) var colorScheme
    
    func body(content: Content) -> some View {
        let darkTheme = K.Colors.goodDarkTheme.clipShape(RoundedRectangle(cornerRadius: 10))
        let lightTheme = K.Colors.goodLightTheme.clipShape(RoundedRectangle(cornerRadius: 10))
        
        content
            .listRowBackground(colorScheme == .light ? lightTheme.brightness(-0.03) : darkTheme.brightness(-0.03))
            .listRowSeparator(.hidden)
        
    }
}

extension View {
    func settingsListBackgroundChange() -> some View {
        return self.modifier(SettingsListBackgroundViewModifier())
    }
}

struct SettingsScreen: View {
    @AppStorage("unittemperature") var temperatureUnit = "Fahrenheit"
    @AppStorage("unitdistance") var distanceUnit = "Miles per hour"
    @EnvironmentObject var appStateManager: AppStateManager
    @EnvironmentObject var persistence: SavedLocationsPersistence
    @Environment(\.colorScheme) var colorScheme
    @State private var locationSaved: Bool = false
    
    var tempUnits = ["Fahrenheit", "Celsius", "Kelvin"]
    var distances = ["Miles per hour", "Kilometers per hour", "Meters per second", "Knots"]
    
    
    
    var body: some View {
        
        
        ZStack(alignment: .top) {
            let darkTheme = K.Colors.goodDarkTheme.clipShape(RoundedRectangle(cornerRadius: 10))
            let lightTheme = K.Colors.goodLightTheme.clipShape(RoundedRectangle(cornerRadius: 10))
            
            
            
            colorScheme == .light ? lightTheme : darkTheme
            
            VStack {
                HStack {
                    Image(systemName: "xmark")
                        .onTapGesture {
                            appStateManager.showSettingScreen = false
                        }
                    Spacer()
                    Text("Tenki Weather")
                    Spacer()
                }
                .font(.title)
                
                List {
                    
                    Picker(selection: $temperatureUnit) {
                        ForEach(tempUnits, id: \.self) { i in
                            Text(i)
                        }
                    } label: {
                        LabelView(title: "Temperature", iconSymbol: "thermometer")
                    }
                    .settingsListBackgroundChange()
                    
                    
                    
                    
                    Picker(selection: $distanceUnit) {
                        ForEach(distances, id: \.self) { i in
                            Text(i)
                        }
                    } label: {
                        LabelView(title: "Distance", iconSymbol: "ruler")
                    }
                    .settingsListBackgroundChange()
                    
                    
                    
                    
                    
                    
                    SendMailView()
                        .settingsListBackgroundChange()
                    
                    
                    
                    Button {
                        persistence.addLocation(locationDictionary: appStateManager.searchedLocationDictionary)
                        locationSaved.toggle()
                        print("Location added")
                    } label: {
                        Label {
                            VStack(alignment: .center) {
                                Text("\(appStateManager.searchedLocationDictionary["name"] as? String ?? "")")
                                    .foregroundColor(.green)
                                Text("Click to save this location")
                                    .lineLimit(1)
                                    .minimumScaleFactor(0.2)
                            }
                            .frame(maxWidth: .infinity)
                        } icon: {
                            Image(systemName: "map")
                        }
                        
                    }
                    .settingsListBackgroundChange()
                    
                }
                .background(colorScheme == .light ? lightTheme.brightness(-0.03) : darkTheme.brightness(-0.03))
                .scrollContentBackground(.hidden)
                .listStyle(.plain)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .scrollIndicators(.hidden)
                
                HStack {
                    
                    NavigationLink {
                        WebView(urlString: "https://www.termsfeed.com/live/942cbe01-c563-4e80-990f-60ed5641579c")
                    } label: {
                        Text("Privacy Policy")
                    }
                    
                    Text("·")
                    
                    
                    NavigationLink {
                        WebView(urlString: "https://www.termsfeed.com/live/ea65e2ba-f3a8-4de0-80f0-2719c1e43d31")
                    } label: {
                        Text("Terms and Conditions")
                    }
                    
                }
                
                
                
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
        }
        .foregroundColor(colorScheme == .light ? .black : .white)
        .alert(isPresented: $locationSaved) {
            Alert(title: Text("Saved"), message: Text("Location saved to favorites"))
        }
        
        
        
    }
}

struct SettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        SettingsScreen()
            .previewDevice("iPhone SE (3rd generation)")
        //            .previewDevice("iPhone 11 Pro Max")
            .frame(height: 300)
            .padding()
            .environmentObject(AppStateManager())
            .environmentObject(SavedLocationsPersistence())
        
        
        SettingsScreen()
            .previewDevice("iPad Pro (12.9-inch) (6th generation)")
        //            .previewDevice("iPhone 11 Pro Max")
            .frame(height: 300)
            .padding()
            .environmentObject(AppStateManager())
            .environmentObject(SavedLocationsPersistence())
        
        
    }
}
