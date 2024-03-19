//
//  ContentView.swift
//  Weather
//
//  Created by Shourya Thakur on 18/03/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HomeView().preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
