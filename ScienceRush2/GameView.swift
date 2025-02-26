//
//  GameView.swift
//  ScienceRush2
//
//  Created by Alejandro Birrueta on 1/9/25.
//

import SwiftUI

struct GameView: View {
    
    @State private var answersOffSetY: Double = 0.0
    @Environment(\.dismiss) var dismiss
    @State var questionsAnswered = 0
    @State var currentLevel = 0 //used in Answer View, Question View, EndGameView
    @State var currentQuestion = 0 //used in Answer View, Question View
    @State var questionShowing = 1.0
    @State var gameRunning = true// true while playing game,false when not
    @State private var skyOffSetY: Double = 0.0
    @State var playerAnswer = ""
    @State var trueShowing : Double = 0.0
    @State var falseShowing : Double = 0.0
    @State var playersAnswers: [String] = []
    @State var playersGradedAnswers : [Bool] = []
    @State var resultShowing = 0.0
    let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    
    @State var counter = 100//for questions showing
    @State var counterForResults = 200

    @State var gameEndedShowing: Double = 0.0
    var body: some View {
        GeometryReader { geometry in
            
            ZStack{
                BackgroundView(skyOffSetY: $skyOffSetY)
                QuestionView(currentLevel: $currentLevel, currentQuestion: $currentQuestion)
                    .opacity(questionShowing)
                AnswerView(currentLevel: $currentLevel, currentQuestion: $currentQuestion, playerAnswer: $playerAnswer)
                    .opacity(questionShowing)
                    .offset(y: answersOffSetY-geometry.size.height)
                GradeAnswerView(trueShowing: $trueShowing, falseShowing: $falseShowing, counterForResults: $counterForResults, questionShowing: $questionShowing, currentQuestion: $currentQuestion, currentLevel: $currentLevel, playerAnswer: $playerAnswer, answersOffSetY: $answersOffSetY, gameEndedShowing: $gameEndedShowing, gameRunning: $gameRunning, counter: $counter, playersGradedAnswers: $playersGradedAnswers)
                EndGameView(currentLevel: $currentLevel, currentQuestion: $currentQuestion, playersGradedAnswers: $playersGradedAnswers)
                    .opacity(gameEndedShowing)
            }//Zstack
            
            .offset(y: 0)
            .navigationBarBackButtonHidden()
            
        }
        .edgesIgnoringSafeArea(.all)
            //loop
            .onReceive(timer) { _ in
                if gameRunning{ skyOffSetY += 2}
                if gameRunning && skyOffSetY >= 874.0 { skyOffSetY = 0 }
                
                
                if counterForResults == 0 {
                    falseShowing = 0.0
                    trueShowing = 0.0
                }
                //counters action
                if counter == 0 {
                    questionShowing = 1.0
                }
                if counterForResults == 0 {
                    falseShowing = 0
                    trueShowing = 0
                }
                if gameRunning && counter != 0 {
                    counter -= 1
                }
                if counterForResults != 0 {
                    counterForResults -= 1
                }
                //scrolling for answers
                answersOffSetY += 2
                if answersOffSetY >= 1500 {
                    answersOffSetY = 0
                }
                if gameRunning == false && counterForResults == 0 {
                    gameEndedShowing = 1.0
                    
                }
                
                
            }
        
            

        
        
        

    }
}
#Preview {
    GameView()
}
