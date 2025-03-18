//
//  GradeAnswerView.swift
//  ScienceRush2
//
//  Created by Alejandro Birrueta on 2/11/25.
//


 
import SwiftUI
struct GradeAnswerView: View {
 
    @Binding var trueShowing: Double
    @Binding var falseShowing: Double
    @Binding var counterForResults: Int
    @Binding var questionShowing: Double
    @Binding var answersShowing: Double
    @Binding var currentQuestion: Int
    @Binding var currentLevel: Int
    @Binding var playerAnswer: String
    @Binding var answersOffSetY: Double
    @Binding var gameEndedShowing: Double
    @Binding var gameRunning: Bool
    @Binding var counter: Int
    
    let correctAnswers =
    [
        ["Cell","Nucleus","Mitochondria","Cell membrane","Chloroplast","Cytoplasm","Ribosome","Golgi apparatus","Cell wall","To store water and nutrients","To break down waste materials","Smooth Endoplasmic Reticulum","To provide structure and support","Prokaryotic and Eukaryotic","To control what enters and exits the cell"]
    ]
    @Binding var playersGradedAnswers : [Bool]
    @Binding var storedAnswers : [String]
    func gradeAnswer(){
        questionShowing = 0.0//hides question when player answers a questions
        //answersOffSetY = 0 // moves questions to top of screen
        counterForResults = 100 //time until resultes dissapers 100=1sec
        counter = 175 //time until question/answers appears 100=1sec
        storedAnswers[currentQuestion] = playerAnswer
         
        if playerAnswer == correctAnswers[currentLevel][currentQuestion] {
            trueShowing = 1.0
            playersGradedAnswers[currentQuestion] = true

        }
        else {
            falseShowing = 1.0// shows result of as false
            playersGradedAnswers[currentQuestion] = false
        }
        if correctAnswers[currentLevel].count - 1 != currentQuestion {
        }
        else {
            gameRunning = false
            questionShowing = 0.0
            answersShowing = 0.0
            //EndGameView(currentLevel: $currentLevel, currentQuestion: $currentQuestion, playersGradedAnswers: $playersGradedAnswers, storedAnswers: $storedAnswers)
        }
    }
    var body: some View {
       Text("INCORRECT")
           .foregroundColor(Color.red)
           .bold()
           .frame(width: 200.0, height: 200.0)
           .background(.black)
           .opacity(falseShowing)
           
       Text("CORRECT")
           .foregroundColor(Color.green)
           .bold()
           .frame(width: 200.0, height: 200.0)
           .background(.black)
           .opacity(trueShowing)
           .onChange(of: playerAnswer) {
               gradeAnswer()
           }
    }
    
}


/*
 #Preview {
 GradeAnswerView()
 }
 */
