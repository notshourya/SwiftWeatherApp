//
//  HomeView.swift
//  Weather
//
//  Created by Shourya Thakur on 18/03/24.
//

import SwiftUI
import BottomSheet

enum BottomSheetPosition: CGFloat, CaseIterable {
    case top = 0.83 // 702/844
    case middle = 0.385 // 325/844
}

struct HomeView: View {
    @State var bottomSheetPosition: BottomSheetPosition = .middle
    @State var bottomSheetTranslation: CGFloat = BottomSheetPosition.middle.rawValue
    @State var hasDragged: Bool = false
    
    var bottomSheetTranslationProrated: CGFloat{
        ( bottomSheetTranslation - BottomSheetPosition.middle.rawValue) / (BottomSheetPosition.top.rawValue - BottomSheetPosition.middle.rawValue)
    }
    
    var body: some View {
        NavigationView{
            GeometryReader { geometry in
                let screenHeight = geometry.size.height +
                                   geometry.safeAreaInsets.top +
                                   geometry.safeAreaInsets.bottom
                let imageOffset = screenHeight + 36
                ZStack{
                    // MARK: Background Color
                    Color.background.ignoresSafeArea()
                    // MARK: Background Image
                    Image("Background").resizable().ignoresSafeArea().offset(y: -bottomSheetTranslationProrated * imageOffset)
                    
                    
                    VStack(spacing: 50 * (1 - bottomSheetTranslationProrated )){
                        Text("Chennai").font(.system(size: 40))
                        
                        
                        VStack(spacing:2){
                            
                            Text(attributedString)
                            
                            Text(" H:36°   L:27°").font(.title3.weight(.semibold))
                                .opacity( 1 - bottomSheetTranslationProrated)
                        }
                        Spacer()
                    }
                    .padding(.top,51)
                    .offset(y: -bottomSheetTranslationProrated * 46)
                    
                    
                    BottomSheetView(position:$bottomSheetPosition){
                      //  Text(bottomSheetTranslationProrated.formatted())
                    } content: {
                        ForecastView(bottomSheetTranslatedProrated: bottomSheetTranslationProrated)
                    }
                    .onBottomSheetDrag{ translation in
                        bottomSheetTranslation = translation / screenHeight
                        
                        withAnimation(.easeInOut){
                            if bottomSheetPosition == BottomSheetPosition.top{
                                hasDragged = true
                            } 
                            else{
                                hasDragged = false
                            }
                        }
                    }
                    //MARK: Tab Bar
                    TabBar(action: {
                        bottomSheetPosition = .top
                    })
                    .offset(y: bottomSheetTranslationProrated * 115)
                }
            }
            .navigationBarHidden(true)
        }
    }
    
    private var attributedString: AttributedString{
        var string = AttributedString("    31°" + (hasDragged ? "  | " : "\n ") + "  Mostly Clear")
        
        if let temp = string.range(of:"31°") {
            string[temp].font = .system(size: (90 - (bottomSheetTranslationProrated * (90 - 20))))
        }
        if let pipe = string.range(of:" | "){
            string[pipe].font = .title3.weight(.semibold)
            string[pipe].foregroundColor = .secondary.opacity(bottomSheetTranslationProrated)
        }
        if let weather = string.range(of:"Mostly Clear"){
            string[weather].font = .title3.weight(.semibold)
            string[weather].foregroundColor = .secondary
        }
        
        return string
    }
}

struct HomeView_Previews:PreviewProvider {
    static var previews: some View{
        HomeView()
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}
