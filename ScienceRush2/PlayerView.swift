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
        HStack(spacing: 0) {
            Rectangle()//left button
                .fill(.clear)
                .frame(width:UIScreen.main.bounds.size.width/2, height: UIScreen.main.bounds.height)
                .contentShape(Rectangle()) // makes area tappable even tho its clear
                .onTapGesture {
                    //left button
                        if xOffset > 0-((screenWidth-100)/2) {
                        xOffset -= screenWidth/4.0
                        }
                }
            Rectangle()//right button
                .fill(.clear)
                .frame(width:UIScreen.main.bounds.size.width/2, height: UIScreen.main.bounds.height)
                .contentShape(Rectangle()) // makes area tappable even tho its clear
                .onTapGesture {
                    //right button
                        if xOffset < (screenWidth-100)/2 {
                            xOffset += screenWidth/4.0
                        }
                }//Hstack
            
            /*
            Button(action: {//left button
                if xOffset > 0-((screenWidth-100)/2) {
                xOffset -= screenWidth/4.0
                }
            }){ 
                Spacer()
            }
            .frame(width:UIScreen.main.bounds.size.width/2, height: UIScreen.main.bounds.height)
            .background(Color(.red))
            .opacity(0.1)
            .contentShape(Rectangle())
            Button("Right") {//right button
                if xOffset < (screenWidth-100)/2 {
                    xOffset += screenWidth/4.0
                }
            }
            .frame(width:UIScreen.main.bounds.size.width/2, height: UIScreen.main.bounds.height)
            .background(Color(.black))
            .opacity(0.1)
            .contentShape(Rectangle())
             */
        }
    }
    
}

//#Preview {
  //  PlayerView()
//}
