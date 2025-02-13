//
//  GameView.swift
//  ScienceRush2
//
//  Created by Alejandro Birrueta on 1/9/25.
//

import SwiftUI

struct GameView: View {
    
    @State private var answersOffSetY: CGFloat = 0.0
    @Environment(\.dismiss) var dismiss
    @State var questionsAnswered = 0
    @State var currentLevel = 0 //used in Answer View, Question View
    @State var currentQuestion = 0 //used in Answer View, Question View
    @State var questionShowing = 0.0
    //@State var trueShowing = 0.0 //used in gradeAnswer
    //@State var falseShowing = 0.0 //used in gradeAnswer
    @State var gameRunning = true
    @State private var skyOffSetY: CGFloat = 0.0
    //@State var playersAnswers: [String] = []
    //@State var playersGradedAnswers: [Int] = []
    
    let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    
    @State var counter = 800
    //@State var twoSec = 0
    @State var gameEndedShowing: Double = 0.0
    
    var body: some View {
        GeometryReader { geometry in
            
            ZStack{
                BackgroundView(skyOffSetY: $skyOffSetY)
                QuestionView(currentLevel: $currentLevel, currentQuestion: $currentQuestion)
                    .opacity(questionShowing)
                AnswerView(currentLevel: $currentLevel, currentQuestion: $currentQuestion)
                    .opacity(questionShowing)
                    .offset(y: answersOffSetY-geometry.size.height)
                EndGameView()
                    .opacity(gameEndedShowing)
                /*
                VStack{
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
                    HStack{
                        Button(answers[currentLevel][currentQuestion][0]) {
                            
                            //GradeAnswerView(playerAnswer: $playerAnswer: )
                            playerAnswer = answers[currentLevel][currentQuestion][0]
                            GradeAnswerView(playerAnswer: $playerAnswer, currentQuestion: $currentQuestion, twoSec: $twoSec, trueShowing: $trueShowing)
                        }
                        .buttonBorderShape(.capsule)
                        .buttonStyle(.borderedProminent)
                        Button(answers[currentLevel][currentQuestion][1]) {
                            gradeAnswer(playerAnswer: answers[currentLevel][currentQuestion][1])
                         }
                        .buttonBorderShape(.capsule)
                        .buttonStyle(.borderedProminent)
                        Button(answers[currentLevel][currentQuestion][2]) {
                            gradeAnswer(playerAnswer: answers[currentLevel][currentQuestion][2])
                        }
                        .buttonBorderShape(.capsule)
                        .buttonStyle(.borderedProminent)
                        Button(answers[currentLevel][currentQuestion][3]) {
                            gradeAnswer(playerAnswer: answers[currentLevel][currentQuestion][3])
                        }
                        .buttonBorderShape(.capsule)
                        .buttonStyle(.borderedProminent)
                    }//hstack
                    .opacity(questionShowing)
                    .offset(y: answersOffSetY-geometry.size.height)
                }//vstack
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                //question view ^
                */
                
                
            }//Zstack
            .offset(y: 0)
            .navigationBarBackButtonHidden()
            
            //loop
            .onReceive(timer) { _ in
                skyOffSetY += 2
                if skyOffSetY >= 874.0 {
                    skyOffSetY = 0
                }

                //counters action
                if counter == 0 {
                    questionShowing = 1.0
                }
                if twoSec == 0 {//twosec was changes to counterForResults in GradeAnswerView
                    falseShowing = 0
                    trueShowing = 0
                    questionShowing = 1.0
                }
                //scrolling for answers
                
                answersOffSetY += 2
                if answersOffSetY >= 1200 {
                    answersOffSetY = 0

                }
                    
                
                //counters
                if twoSec == 1 {
                    if counter != 0 {
                        counter -= 1
                    }
                }
                if twoSec != 0 {
                    twoSec -= 1
                }
            }
            
        }
        .edgesIgnoringSafeArea(.all)
        

    }
    
}
#Preview {
    GameView()
}
