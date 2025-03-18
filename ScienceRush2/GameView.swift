//
//  GameView.swift
//  ScienceRush2
//
//  Created by Alejandro Birrueta on 1/9/25.
//

import SwiftUI

struct GameView: View {
    @State var xOffset: Double = Double((UIScreen.main.bounds.size.width-50)/8)
    @State var correctAnswers: [[String]] =
    [
        ["Cell","Nucleus","Mitochondria","Cell membrane","Chloroplast","Cytoplasm","Ribosome","Golgi apparatus","Cell wall","To store water and nutrients","To break down waste materials","Smooth Endoplasmic Reticulum","To provide structure and support","Prokaryotic and Eukaryotic","To control what enters and exits the cell"]
    ]
    @State var question: [[String]] =
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
    @State var storedAnswers : [String] = ["","","","","","","","","","","","","","",""]

    @State private var answersOffSetY: Double = 0.0
    @Environment(\.dismiss) var dismiss
    @State var questionsAnswered = 0
    @State var currentLevel = 0 //used in Answer View, Question View, EndGameView
    @State var currentQuestion = 0 //used in Answer View, Question View
    @State var questionShowing = 1.0
    @State var answersShowing = 1.0
    @State var gameRunning = true// true while playing game,false when not
    @State private var skyOffSetY: Double = 0.0
    @State var playerAnswer = ""
    @State var trueShowing : Double = 0.0
    @State var falseShowing : Double = 0.0
    @State var playersAnswers: [String] = []
    @State var playersGradedAnswers : [Bool] = [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false]
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
                AnswerView(currentLevel: $currentLevel, currentQuestion: $currentQuestion, playerAnswer: $playerAnswer,answersOffSetY: $answersOffSetY,xOffset: $xOffset)
                    .offset(y: answersOffSetY-geometry.size.height)
                    .opacity(1)
                GradeAnswerView(trueShowing: $trueShowing, falseShowing: $falseShowing, counterForResults: $counterForResults, questionShowing: $questionShowing, answersShowing: $answersShowing, currentQuestion: $currentQuestion, currentLevel: $currentLevel, playerAnswer: $playerAnswer, answersOffSetY: $answersOffSetY, gameEndedShowing: $gameEndedShowing, gameRunning: $gameRunning, counter: $counter, playersGradedAnswers: $playersGradedAnswers, storedAnswers: $storedAnswers)
                PlayerView(xOffset: $xOffset)
                EndGameView(currentLevel: $currentLevel, currentQuestion: $currentQuestion, playersGradedAnswers: $playersGradedAnswers, storedAnswers: $storedAnswers, question: $question, correctAnswers: $correctAnswers)
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
                answersOffSetY += 1.5
                if answersOffSetY >= 1350 {
                    if correctAnswers[currentLevel].count - 1 != currentQuestion {
                        currentQuestion += 1
                    }

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
