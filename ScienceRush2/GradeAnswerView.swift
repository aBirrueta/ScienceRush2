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
    @State var counterForResults : Int = 0
    //
    @State var trueShowing : Double = 0.0
    @State var falseShowing : Double = 0.0
    
    let resultTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
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
           .opacity(falseShowing)
           
       Text("CORRECT")
           .foregroundColor(Color.green)
           .bold()
           .frame(width: 200.0, height: 200.0)
           .background(.black)
           .opacity(trueShowing)
        
           .onReceive(resultTimer) { _ in
               if playerAnswer == correctAnswers[currentLevel][currentQuestion] {
                   counterForResults = 1
                   trueShowing = 1.0
                   //questionShowing = 0.0
                   playersGradedAnswers.append(1)
               }
               else {
                   counterForResults = 1
                   falseShowing = 1.0
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
               
               if counterForResults == 0 {//twosec was changes to counterForResults in GradeAnswerView
                   falseShowing = 0.0
                   trueShowing = 0.0
                   //questionShowing = 1.0
               }
               // if counterForResults == 1 {
               // if counter != 0 {
               //   counter -= 1
               //}
               // }
               if counterForResults != 0 {
                   counterForResults -= 1
               }
               //answersOffSetY = -200
           }

    }
    //playersAnswers.append(playerAnswer)

    
}


/*
 #Preview {
 GradeAnswerView()
 }
 */
