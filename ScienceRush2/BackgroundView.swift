//
//  BackgroundView.swift
//  ScienceRush2
//
//  Created by Alejandro Birrueta on 2/6/25.
//

import SwiftUI

struct BackgroundView: View {
    @Binding var skyOffSetY : Double
        var body: some View {
        
        GeometryReader { geometry in
            ZStack{
                Image("sky background loop")
                    .resizable()
                    .offset(y: skyOffSetY)
                    .clipped()
                    .aspectRatio(contentMode: .fill)
                Image("sky background loop")
                    .resizable()
                    .offset(y: skyOffSetY-geometry.size.height)
                    .clipped()
                    .aspectRatio(contentMode: .fill)
            }
        }
    }
}


