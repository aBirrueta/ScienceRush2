//
//  ContentView.swift
//  ScienceRush2
//
//  Created by Alejandro Birrueta on 1/8/25.
//

import SwiftUI

struct ContentView: View {
    @State var showingGame = false
    var body: some View {
        NavigationStack{
            VStack {
                Text("SCIENCE RUSH")
                    .fontWeight(.black)
                    .foregroundColor(Color(red: 0, green: 100, blue: 0, opacity: 1.0))
                    .padding(.bottom, 70)
                    .font(.title)
                
                
                Button("PLAY"){
                    showingGame = true
                }
                .buttonStyle(.borderedProminent)
                .padding(200)
                HStack{
                    Button("settings") {
                        
                    }
                    .buttonBorderShape(.capsule)
                    .buttonStyle(.bordered)
                    Button("shop") {
                        
                    }
                    .buttonBorderShape(.capsule)
                    .buttonStyle(.bordered)
                    
                    
                    
                }
            }
            .padding(.vertical)
            .frame(width: 500, height: 800)
            .navigationDestination(isPresented: $showingGame) {
                GameView()
            }
        }
    }
}

#Preview {
    ContentView()
}
