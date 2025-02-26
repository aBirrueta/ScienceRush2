//
//  EndGameView.swift
//  ScienceRush2
//
//  Created by Alejandro Birrueta on 2/4/25.
//

import SwiftUI

struct EndGameView: View {
    
    @Binding var currentLevel: Int
    @Binding var currentQuestion: Int
    @Binding var playersGradedAnswers: [Bool]
    @Binding var storedAnswers : [String]
    let question =
    [
        ["What is the basic unit of life?",
         "What part of the cell controls its activities?",
         "Which structure provides energy to the cell?",
         "What surrounds and protects animal cells?",
         "Which organelle is responsible for photosynthesis in plant cells?",
         "What is the jelly-like substance inside a cell called?",
         "Which organelle is known as the 'protein factory' of the cell?",
         "Which cell organelle packages and distributes proteins?",
         "What do plant cells have that animal cells do not?",
         "What is the function of the vacuole in plant cells?",
         "What is the role of the lysosome in the cell?",
         "Which part of the cell is responsible for making lipids?",
         "What is the main purpose of the cytoskeleton in a cell?",
         "What are the two main types of cells?",
         "What is the function of the cell membrane?"]
    ]
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
                    Text("\(question[currentLevel][currentQuestion]) \(playersGradedAnswers[0])")
                    if playersGradedAnswers[0] {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundStyle(.green)
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
        @State var storedAnswers = ["cell","mitochondria"]
        @State var currentQuestion = 0
        var body: some View {
            EndGameView(currentLevel: $currentLevel, currentQuestion: $currentQuestion, playersGradedAnswers: $playersGradedAnswers, storedAnswers: $storedAnswers)
        }
    }
    return Preview()
}

