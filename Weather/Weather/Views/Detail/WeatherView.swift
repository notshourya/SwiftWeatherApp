//
//  WeatherView.swift
//  Weather
//
//  Created by Shourya Thakur on 19/03/24.
//

import SwiftUI

struct WeatherView: View {
    @State private var searchText = ""
    
    var searchResults: [Forecast]{
        if searchText.isEmpty{
            return Forecast.cities
        }
        else{
            return Forecast.cities.filter {$0.location.contains(searchText)}
        }
    }
    
    var body: some View {
        ZStack{
            Color.background.ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20){
                    ForEach(searchResults) { forecast in
                        WeatherWidget(forecast: forecast)
                    }
                }
            }
            .safeAreaInset(edge: .top){
                EmptyView()
                    .frame(height: 110)
            }
            
        }
        .overlay{
            NavigationBar(searchText: $searchText)
        }
        .navigationBarHidden(true)
       // .searchable(text: $searchText , placement: .navigationBarDrawer(displayMode: .always))
    }
}

#Preview {
    NavigationView{
        WeatherView()
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}
