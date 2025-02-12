//
//  GradeAnswerView.swift
//  ScienceRush2
//
//  Created by Alejandro Birrueta on 2/11/25.
//

/*
 
import SwiftUI

struct GradeAnswerView: View {
    
    @State var playersAnswers: [String] = []
    @Binding var playerAnswer: String
    @Binding var currentQuestion: Int
    @Binding var currentLevel: Int
    @Binding var twoSec: Int
    @Binding var trueShowing: Int
    @Binding var questionShowing: Double
    @Binding var playersGradedAnswers: [Int]
    @Binding var falseShowing: Double

    let correctAnswers = ["Cell","Nucleus","Mitochondria","Cell membrane","Chloroplast","Cytoplasm","Ribosome","Golgi apparatus","Cell wall","To store water and nutrients","To break down waste materials","Smooth Endoplasmic Reticulum","To provide structure and support","Prokaryotic and Eukaryotic","To control what enters and exits the cell"]

    var body: some View {
        playersAnswers.append(playerAnswer)
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
        
        answersOffSetY = -200
    }
}

#Preview {
    GradeAnswerView()
 }*/
