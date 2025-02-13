//
//  GradeAnswerView.swift
//  ScienceRush2
//
//  Created by Alejandro Birrueta on 2/11/25.
//


 
import SwiftUI
struct GradeAnswerView: View {
    @Binding var playerAnswer: String
    @Binding var currentLevel : Int
    @Binding var currentQuestion : Int
    @State var playersAnswers: [String] = []
    @State var playersGradedAnswers: [Int] = []
    // counter
    @State var counterForResults = 0
    //
    @State var trueShowing = 0.0
    @State var falseShowing = 0.0
    
    /*
    @Binding var playerAnswer: String
    @Binding var currentQuestion: Int
    @Binding var currentLevel: Int
    @Binding var trueShowing: Int
    @Binding var questionShowing: Double
    @Binding var playersGradedAnswers: [Int]
    @Binding var falseShowing: Double
     */
    let correctAnswers =
    [
        ["Cell","Nucleus","Mitochondria","Cell membrane","Chloroplast","Cytoplasm","Ribosome","Golgi apparatus","Cell wall","To store water and nutrients","To break down waste materials","Smooth Endoplasmic Reticulum","To provide structure and support","Prokaryotic and Eukaryotic","To control what enters and exits the cell"]
    ]

    var body: some View {
       Text("INCORRECT")
           .foregroundColor(Color.red)
           .bold()
           .frame(width: 200.0, height: 200.0)
           .background(.black)
           //.opacity(falseShowing)
           
       Text("CORRECT")
           .foregroundColor(Color.green)
           .bold()
           .frame(width: 200.0, height: 200.0)
           .background(.black)
           //.opacity(trueShowing)
        
        playersAnswers.append(playerAnswer)
        if playerAnswer == correctAnswers[currentLevel][currentQuestion] {
            counterForResults = 100
            trueShowing = 1
            //questionShowing = 0.0
            playersGradedAnswers.append(1)
        }
        else {
            counterForResults = 100
            
            falseShowing = 1
            //questionShowing = 0.0
            playersGradedAnswers.append(0)
            
        }
        if correctAnswers[currentLevel].count - 1 != currentQuestion {
            currentQuestion += 1
        }
        else {
            EndGameView()
            //questionShowing = 0.0
        }
        
        //answersOffSetY = -200
   
    }
}


/*
 #Preview {
 GradeAnswerView()
 }
 */
