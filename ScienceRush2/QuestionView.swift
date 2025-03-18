//
//  QuestionView.swift
//  ScienceRush2
//
//  Created by Alejandro Birrueta on 2/11/25.
//

import SwiftUI

struct QuestionView: View {
    @Binding var currentLevel: Int
    @Binding var currentQuestion: Int
    
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
    
    var body: some View {
        Text(question[currentLevel][currentQuestion])
            .position(x: 200, y: 100)
            .fontWeight(.black)
        
        
    }
}
