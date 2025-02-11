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
    @State var currentLevel = 0
    @State var levelProgress = 0
    @State var currentQuestion = 0
    @State var questionShowing = 0.0
    @State var trueShowing = 0.0
    @State var falseShowing = 0.0
    @State var gameRunning = true
    @State private var skyOffSetY: CGFloat = 0.0
    @State var playersAnswer : String
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
    let answers =
            [
                [
                    ["Atom", "Cell", "Tissue", "Organ"],
                    ["Mitochondria", "Nucleus", "Cell membrane", "Ribosome"],
                    ["Lysosome", "Ribosome", "Mitochondria", "Chloroplast"],
                    ["Cell wall", "Cytoplasm", "Cell membrane", "Nucleus"],
                    ["Chloroplast", "Vacuole", "Ribosome", "Mitochondria"],
                    ["Cytoplasm", "Nucleus", "Cell membrane", "Golgi apparatus"],
                    ["Mitochondria", "Ribosome", "Endoplasmic reticulum", "Lysosome"],
                    ["Golgi apparatus", "Endoplasmic reticulum", "Ribosome", "Lysosome"],
                    ["Nucleus", "Mitochondria", "Cell wall", "Cell membrane"],
                    ["To store energy", "To store water and nutrients", "To produce proteins", "To protect the cell"],
                    ["To produce energy", "To break down waste materials", "To transport molecules", "To store DNA"],
                    ["Smooth Endoplasmic Reticulum", "Ribosome", "Mitochondria", "Golgi apparatus"],
                    ["To produce proteins", "To provide structure and support", "To store genetic material", "To break down toxins"],
                    ["Plant and Animal", "Prokaryotic and Eukaryotic", "Bacteria and Virus", "Nucleus and Non-Nucleus"],
                    ["To provide energy", "To control what enters and exits the cell", "To produce proteins", "To store waste"]
                ]
            ]
                
                
                 
    let correctAnswers = ["Cell","Nucleus","Mitochondria","Cell membrane","Chloroplast","Cytoplasm","Ribosome","Golgi apparatus","Cell wall","To store water and nutrients","To break down waste materials","Smooth Endoplasmic Reticulum","To provide structure and support","Prokaryotic and Eukaryotic","To control what enters and exits the cell"]
    
    @State var playersAnswers: [String] = []
    @State var playersGradedAnswers: [Int] = []
    
    let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    
    @State var counter = 800
    @State var twoSec = 0
    @State var gameEndedShowing: Double = 0.0
    
    
    
    func gradeAnswer(playerAnswer: String) { //function determines if question right or wrong
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
    } //closing gradeAnswer
        
    
    
    var body: some View {
        GeometryReader { geometry in
            
            ZStack{
                BackgroundView(skyOffSetY: $skyOffSetY)
                
                
                // Question view v
                Text(question[currentLevel][currentQuestion]+"?")
                    .position(x: 200, y: 100)
                    .fontWeight(.black)
                    .opacity(questionShowing)
                EndGameView()
                    .opacity(gameEndedShowing)
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
                            playersAnswer = answers[currentLevel][currentQuestion][0]
                            GradeAnswerView(playerAnswer: $playersAnswer, currentQuestion: $currentQuestion)
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
                if twoSec == 0 {
                    falseShowing = 0
                    trueShowing = 0
                    questionShowing = 1.0
                }
                //scrolling for answers
                
                answersOffSetY += 2
                if answersOffSetY >= 1200 {
                    answersOffSetY = 0
                    gradeAnswer(playerAnswer: "n/a")
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
