//
//  GradeAnswerView.swift
//  ScienceRush2
//
//  Created by Alejandro Birrueta on 2/11/25.
//

import SwiftUI

struct GradeAnswerView: View {
    
    @State var playersAnswers: [String] = []
    @Binding var playersAnswer: String
    @Binding var currentQuestion: Int
    
    let correctAnswers = ["Cell","Nucleus","Mitochondria","Cell membrane","Chloroplast","Cytoplasm","Ribosome","Golgi apparatus","Cell wall","To store water and nutrients","To break down waste materials","Smooth Endoplasmic Reticulum","To provide structure and support","Prokaryotic and Eukaryotic","To control what enters and exits the cell"]

    var body: some View {
        playersAnswers.append(playersAnswer)
        if playerAnswer == correctAnswers[currentQuestion] {
            twoSec = 100
            trueShowing = 1
            questionShowing = 0.0
            playersGradedAnswers.append(1)
        }
        else {
            twoSec = 100
            
            falseShowing = 1
            questionShowing = 0.0
            playersGradedAnswers.append(0)

        }
        if answers[currentLevel].count - 1 != currentQuestion {
            currentQuestion += 1
        }
        else {
            gameEndedShowing = 1.0
            questionShowing = 0.0
        }
        
        answersOffSetY = -200    }
}

#Preview {
    GradeAnswerView()
}
