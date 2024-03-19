//
//  TabBar.swift
//  Weather
//
//  Created by Shourya Thakur on 18/03/24.
//

import SwiftUI

struct TabBar: View {
    var action: () -> Void
    var body: some View {
        ZStack{
            // MARK: Arc Shape
            Arc()
                .fill(Color.tabBarbackground)
                .frame(height:88)
                .overlay{
                    //MARK: Arc Border
                    Arc()
                        .stroke(Color.tabBarBorder,lineWidth: 0.2)
                }
            // MARK: Tab Items
            HStack{
                // MARK: Expand Button
                Button{
                    action()
                }
            label: {
                Image(systemName: "mappin.and.ellipse").frame(width:44 , height: 44)
                }
                
                Spacer()
                
                //MARK: Navigation Button
                NavigationLink{
                    WeatherView()
                }
            label: {
                Image(systemName:"list.star").frame(width:44 ,
                 height: 44)
            }
            }
            .font(.title2)
            .foregroundColor(.white.opacity(0.7))
            .padding(EdgeInsets(top: 20, leading: 32, bottom: 24, trailing: 32))
            
        }
        .frame(maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
    }
}

#Preview {
    TabBar(action: {})
        .preferredColorScheme(.dark)
}
