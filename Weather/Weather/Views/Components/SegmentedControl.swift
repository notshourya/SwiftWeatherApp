//
//  SegmentedControl.swift
//  Weather
//
//  Created by Shourya Thakur on 19/03/24.
//

import SwiftUI

struct SegmentedControl: View {
    @Binding var selection: Int
    
    var body: some View {
        VStack(spacing : 5){
            //MARK: SegmentedButtons
            HStack{
                Button{
                    withAnimation(.easeInOut(duration: 0.5)){
                        selection = 0
                    }
                } label: {
                    Text("Hourly Forecast")
                }.frame(minWidth: 0, maxWidth: .infinity)
                
                Button{
                    withAnimation(.easeInOut(duration: 0.5)){
                        selection = 1
                    }
                } label: {
                    Text("Weekly Forecast")
                }.frame(minWidth: 0, maxWidth: .infinity)
            }
            .font(.subheadline.weight(.semibold))
            .foregroundColor(.secondary)
            
            //MARK: Separator
            Divider()
                .background(.white.opacity(0.5))
                .blendMode(.overlay)
                .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.2), radius: 0, x: 0, y: 1)
                .blendMode(.overlay)
                .overlay{
                    //MARK: Udnerline
                    HStack{
                        Divider()
                            .frame(width: UIScreen.main.bounds.width / 2 , height: 3 )
                            .background(Color.underline)
                            .blendMode(.overlay)
                    }
                    .frame(maxWidth: .infinity , alignment: selection == 0 ? .leading : .trailing)
                    .offset(y : -1)
                }
        }
        .padding(.top ,25)
    }
}

#Preview {
    SegmentedControl(selection: .constant(0))
}
