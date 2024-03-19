//
//  ForecastModel.swift
//  Weather
//
//  Created by Shourya Thakur on 19/03/24.
//

import Foundation

enum ForecastPeriod {
    case hourly
    case weekly
}

enum Weather: String {
    case clear = "Clear"
    case cloudy = "Cloudy"
    case rainy = "Mid Rain"
    case stormy = "Showers"
    case sunny = "Sunny"
    case tornado = "Tornado"
    case windy = "Fast Wind"
}

struct Forecast: Identifiable {
    var id = UUID()
    var date: Date
    var weather: Weather
    var probability: Int
    var temperature: Int
    var high: Int
    var low: Int
    var location: String
    
    var icon: String {
        switch weather {
        case .clear:
            return "Moon"
        case .cloudy:
            return "Cloud"
        case .rainy:
            return "Moon cloud mid rain"
        case .stormy:
            return "Sun cloud angled rain"
        case .sunny:
            return "Sun"
        case .tornado:
            return "Tornado"
        case .windy:
            return "Moon cloud fast wind"
        }
    }
}

extension Forecast {
    static let hour: TimeInterval = 60 * 60
    static let day: TimeInterval = 60 * 60 * 24
    
    static let hourly: [Forecast] = [
        Forecast(date: .init(timeIntervalSinceNow: hour * -1), weather: .rainy, probability: 30, temperature: 31, high: 36, low: 27, location: "Chennai, India"),
        Forecast(date: .now, weather: .rainy, probability: 0, temperature: 31, high: 24, low: 18, location: "Chennai, India"),
        Forecast(date: .init(timeIntervalSinceNow: hour * 1), weather: .windy, probability: 0, temperature: 31, high: 37, low: 27, location: "Chennai, India"),
        Forecast(date: .init(timeIntervalSinceNow: hour * 2), weather: .rainy, probability: 0, temperature: 30, high: 36, low: 26, location: "Chennai, India"),
        Forecast(date: .init(timeIntervalSinceNow: hour * 3), weather: .rainy, probability: 0, temperature: 31, high: 37, low: 26, location: "Chennai, India"),
        Forecast(date: .init(timeIntervalSinceNow: hour * 4), weather: .rainy, probability: 0, temperature: 31, high: 37, low: 27, location: "Chennai, India"),
        Forecast(date: .init(timeIntervalSinceNow: hour * 5), weather: .rainy, probability: 30, temperature: 31, high: 36, low: 26, location: "Chennai, India"),
        Forecast(date: .init(timeIntervalSinceNow: hour * 6), weather: .windy, probability: 0, temperature: 31, high: 36, low: 27, location: "Chennai, India"),
        Forecast(date: .init(timeIntervalSinceNow: hour * 7), weather: .rainy, probability: 0, temperature: 30, high: 35, low: 25, location: "Chennai, India"),
        Forecast(date: .init(timeIntervalSinceNow: hour * 8), weather: .rainy, probability: 0, temperature: 31, high: 36, low: 28, location: "Chennai, India"),
        Forecast(date: .init(timeIntervalSinceNow: hour * 9), weather: .rainy, probability: 0, temperature: 31, high: 36, low: 27, location: "Chennai, India"),
        Forecast(date: .init(timeIntervalSinceNow: hour * 10), weather: .rainy, probability: 0, temperature: 32, high: 38, low: 29, location: "Chennai, India")
    ]

    
    static let weekly: [Forecast] = [
        Forecast(date: .init(timeIntervalSinceNow: 0), weather: .rainy, probability: 30, temperature: 31, high: 36, low: 27, location: "Chennai, India"),
        Forecast(date: .init(timeIntervalSinceNow: day * 1), weather: .rainy, probability: 0, temperature: 33, high: 38, low: 29, location: "Chennai, India"),
        Forecast(date: .init(timeIntervalSinceNow: day * 2), weather: .stormy, probability: 100, temperature: 30, high: 34, low: 24, location: "Chennai, India"),
        Forecast(date: .init(timeIntervalSinceNow: day * 3), weather: .stormy, probability: 50, temperature: 32, high: 35, low: 28, location: "Chennai, India"),
        Forecast(date: .init(timeIntervalSinceNow: day * 4), weather: .rainy, probability: 0, temperature: 33, high: 36, low: 30, location: "Chennai, India"),
        Forecast(date: .init(timeIntervalSinceNow: day * 5), weather: .rainy, probability: 0, temperature: 34, high: 36, low: 29, location: "Chennai, India"),
        Forecast(date: .init(timeIntervalSinceNow: day * 6), weather: .rainy, probability: 0, temperature: 35, high: 37, low: 31, location: "Chennai, India"),
        Forecast(date: .init(timeIntervalSinceNow: day * 7), weather: .stormy, probability: 100, temperature: 31, high: 34, low: 28, location: "Chennai, India"),
        Forecast(date: .init(timeIntervalSinceNow: day * 8), weather: .stormy, probability: 50, temperature: 33, high: 35, low: 29, location: "Chennai, India"),
        Forecast(date: .init(timeIntervalSinceNow: day * 9), weather: .rainy, probability: 0, temperature: 32, high: 35, low: 28, location: "Chennai, India"),
        Forecast(date: .init(timeIntervalSinceNow: day * 10), weather: .rainy, probability: 0, temperature: 33, high: 36, low: 30, location: "Chennai, India"),
    ]
    
    static let cities: [Forecast] = [
        Forecast(date: .now, weather: .rainy, probability: 0, temperature: 31, high: 36, low: 27, location: "Chennai, India"),
        Forecast(date: .now, weather: .windy, probability: 0, temperature: 20, high: 21, low: 19, location: "Toronto, Canada"),
        Forecast(date: .now, weather: .stormy, probability: 0, temperature: 13, high: 16, low: 8, location: "Tokyo, Japan"),
        Forecast(date: .now, weather: .tornado, probability: 0, temperature: 23, high: 26, low: 16, location: "Tennessee, USA"),
        Forecast(date: .now, weather: .rainy, probability: 0, temperature: 19, high: 24, low: 18, location: "London, United Kingdom"),
        Forecast(date: .now, weather: .windy, probability: 0, temperature: 22, high: 27, low: 17, location: "Paris, France"),
        Forecast(date: .now, weather: .stormy, probability: 0, temperature: 33, high: 16, low: 8, location: "Sydney, Australia"),
        Forecast(date: .now, weather: .tornado, probability: 0, temperature: 24, high: 28, low: 19, location: "Moscow, Russia")
        
    ]
}
