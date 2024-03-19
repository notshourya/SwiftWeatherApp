//
//  NavigationBar.swift
//  Weather
//
//  Created by Shourya Thakur on 19/03/24.
//

import SwiftUI

struct NavigationBar: View {
    @Binding var searchText : String
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack(spacing: 8){
            HStack{
                Button{
                    dismiss()
                } label: {
                    HStack(spacing: 5){
                        Image(systemName:"chevron.left")
                            .font(.system(size:20).weight(.medium))
                            .foregroundColor(.secondary)
                        
                        Text("Weather")
                            .font(.title2)
                            .foregroundColor(.primary)
                    }
                    .frame(height: 44)
                    
                }
                
                Spacer()
                
                Image(systemName:"ellipsis.circle")
                    .font(.system(size: 24))
                    .frame(width: 44, height: 44, alignment: .trailing)
                
            }
            .frame(height: 52)
            
            HStack(spacing: 2){
                Image(systemName:"magnifyingglass")
                TextField("Search for a City", text: $searchText)
            }
            .foregroundColor(.secondary)
            .padding(.horizontal, 6)
            .padding(.vertical, 7)
            .frame(height: 36, alignment: .leading)
            .background(Color.bottomSheetBackground , in: RoundedRectangle(cornerRadius: 9))
            .innershadow(shape: RoundedRectangle(cornerRadius: 9), color: .black.opacity(0.25), lineWidth: 2, offsetX: 0, offsetY: 2, blur: 2)
        }
        .frame(height: 106, alignment: .top)
        .padding(.horizontal, 16)
        .padding(.top, 50)
        .backgroundBlur( radius: 20, opaque: true)
        .background(Color.navBarbackground)
        .frame(maxHeight : .infinity, alignment: .top)
        .ignoresSafeArea()
    }
}

#Preview {
    NavigationBar(searchText: .constant(""))
}
