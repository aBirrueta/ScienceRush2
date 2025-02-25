//
//  EndGameView.swift
//  ScienceRush2
//
//  Created by Alejandro Birrueta on 2/4/25.
//

import SwiftUI

struct EndGameView: View {
    
    @Binding var currentLevel: Int
    @Binding var playersGradedAnswers: [Bool]
    let correctAnswers =
    [
        ["Cell","Nucleus","Mitochondria","Cell membrane","Chloroplast","Cytoplasm","Ribosome","Golgi apparatus","Cell wall","To store water and nutrients","To break down waste materials","Smooth Endoplasmic Reticulum","To provide structure and support","Prokaryotic and Eukaryotic","To control what enters and exits the cell"]
    ]
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 15)
                .fill(.quinary)
                .frame(width: 350, height: 550)
            VStack{
                Text("Level \(currentLevel+1) complete")
                    .font(.title)
                    .fontWeight(.black)
                    
                Text("score: \(playersGradedAnswers.filter{$0 == true}.count)/\(playersGradedAnswers.count)")
                    .font(.title)
                    .fontWeight(.bold)
                HStack{
                    Text("Question 1: \(playersGradedAnswers[0])")
                    if playersGradedAnswers[0] {
                        Image(systemName: "check")
                    }
                    else{
                        Image(systemName: "xmark")
                    }
                }
                
                
            }
            
        }
        
    }
    
}

#Preview {
    struct Preview: View {
        @State var currentLevel : Int = 0
        @State var playersGradedAnswers : [Bool] = [true,false]
        var body: some View {
            EndGameView(currentLevel: $currentLevel, playersGradedAnswers: $playersGradedAnswers)
        }
    }
    return Preview()
}

