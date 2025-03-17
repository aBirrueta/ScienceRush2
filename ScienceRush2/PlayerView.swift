//
//  PlayerView.swift
//  ScienceRush2
//
//  Created by Alejandro Birrueta on 3/5/25.
//

import SwiftUI

struct PlayerView: View {
    let screenWidth: Double = Double(UIScreen.main.bounds.size.width-50)
    @Binding var xOffset: Double 
    var body: some View {
            Image("rocket")
                .resizable()
                .frame(width: 100, height: 100)
                .aspectRatio(contentMode: .fit)
                .offset(x:xOffset, y:300)
                .onChange(of: xOffset) {print(xOffset)}
        HStack{
            Button("left") {
                if xOffset > 0-((screenWidth-100)/2) {
                    xOffset -= screenWidth/4.0
                }
            }
            Button("right") {
                if xOffset < (screenWidth-100)/2 {
                    xOffset += screenWidth/4.0
                }
            }
        }
    }
    
}

//#Preview {
  //  PlayerView()
//}
