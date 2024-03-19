//
//  WeatherWidget.swift
//  Weather
//
//  Created by Shourya Thakur on 19/03/24.
//

import SwiftUI

struct WeatherWidget: View {
    var forecast: Forecast
    var body: some View {
        ZStack(alignment: .bottom) {
            Trapezoid()
                .fill(Color.weatherWidgetbackground)
                .frame(width: 342, height: 174)
            
            HStack(alignment: .bottom){
                VStack(alignment: .leading, spacing: 8)
                {
                    Text("\(forecast.temperature)°")
                        .font(.system(size: 64))
                    
                    VStack(alignment: .leading, spacing: 2)
                    {
                        Text("H:\(forecast.high)° L:\(forecast.low)°")
                            .font(.footnote)
                            .foregroundColor(.secondary)
                        
                        Text(forecast.location)
                            .font(.body)
                            .lineLimit(1)
                    }
                }
                Spacer()
                
                VStack(alignment: .trailing , spacing: 0){
                    Image("\(forecast.icon) large")
                        .padding(.trailing,4)
                    Text(forecast.weather.rawValue)
                        .font(.footnote)
                        .padding(.trailing, 50)
                }
            }
            .foregroundColor(.white)
            .padding(.bottom, 20)
            .padding(.leading, 20)

            }
        .frame(width: 342, height: 184, alignment: .bottom)
    }
}

#Preview {
    WeatherWidget(forecast: Forecast.cities[0])
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}
