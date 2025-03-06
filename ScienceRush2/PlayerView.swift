//
//  PlayerView.swift
//  ScienceRush2
//
//  Created by Alejandro Birrueta on 3/5/25.
//

import SwiftUI

struct PlayerView: View {
    @State private var offset: Double = 100.5
    let screenWidth: Double = Double(UIScreen.main.bounds.size.width)

    var body: some View {
        //offset = screenWidth/4.0
        Image("rocket")
            .resizable()
               .frame(width: 100, height: 100)
               .aspectRatio(contentMode: .fit)
               .offset(x:offset)
        HStack{
            Button("left") {
                offset -= screenWidth/4.0
            }
            Button("right") {
                offset += screenWidth/4.0
            }
        }
    }
    
}

#Preview {
    PlayerView()
}
