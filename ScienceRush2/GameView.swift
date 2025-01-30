//
//  GameView.swift
//  ScienceRush2
//
//  Created by Alejandro Birrueta on 1/9/25.
//

import SwiftUI

struct GameView: View {
    
    @State private var offsetY: CGFloat = 0.0
    @Environment(\.dismiss) var dismiss
    @State var questionsAnswered = 0
    @State var currentLevel = 0
    @State var levelProgress = 0
    @State var currentQuestion = 0
    @State var questionShowing = 0.0
    @State var trueShowing = 0.0
    @State var falseShowing = 0.0
    let question = ["What is the basic unit of life?",
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
    let answers = [["Atom", "Cell", "Tissue", "Organ"],
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
                   ["To provide energy", "To control what enters and exits the cell", "To produce proteins", "To store waste"]]
    let correctAnswers = ["Cell","Nucleus","Mitochondria","Cell membrane","Chloroplast","Cytoplasm","Ribosome","Golgi apparatus","Cell wall","To store water and nutrients","To break down waste materials","Smooth Endoplasmic Reticulum","To provide structure and support","Prokaryotic and Eukaryotic","To control what enters and exits the cell"]
    var playersAnswers = [""]
    
    let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    
    @State var counter = 800
    @State var twoSec = 0
    
    func gradeAnswer(playerAnswer: String) { //function determines if question right or wrong
        if playerAnswer == correctAnswers[currentQuestion] {
            twoSec = 200
            trueShowing = 1
            questionShowing = 0.0
        }
        else {
            twoSec = 200
            
            falseShowing = 1
            questionShowing = 0.0
        }
    } //closing gradeAnswer
    func questionAnswered(playerAnswer: String) {
        currentQuestion += 1
        
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                Image("sky background loop")
                    .resizable()
                    .offset(y: offsetY)
                    .clipped()
                    .aspectRatio(contentMode: .fill)
                Image("sky background loop")
                    .resizable()
                    .offset(y: offsetY-geometry.size.height)
                    .clipped()
                    .aspectRatio(contentMode: .fill)
                
                Text(question[currentQuestion]+"?")
                    .position(x: 200, y: 100)
                    .fontWeight(.black)
                    .opacity(questionShowing)
                
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
                        Button(answers[currentQuestion][0]) {
                            gradeAnswer(playerAnswer: answers[currentQuestion][0])
                            
                            currentQuestion += 1                        }
                        .buttonBorderShape(.capsule)
                        .buttonStyle(.borderedProminent)
                        Button(answers[currentQuestion][1]) {
                            gradeAnswer(playerAnswer: answers[currentQuestion][1])
                            currentQuestion += 1                          }
                        .buttonBorderShape(.capsule)
                        .buttonStyle(.borderedProminent)
                        Button(answers[currentQuestion][2]) {
                            gradeAnswer(playerAnswer: answers[currentQuestion][2])
                            currentQuestion += 1                          }
                        .buttonBorderShape(.capsule)
                        .buttonStyle(.borderedProminent)
                        Button(answers[currentQuestion][3]) {
                            gradeAnswer(playerAnswer: answers[currentQuestion][3])
                            currentQuestion += 1                          }
                        .buttonBorderShape(.capsule)
                        .buttonStyle(.borderedProminent)
                    }
                    .opacity(questionShowing)
                    .offset(y: offsetY-geometry.size.height)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                

            }
            .offset(y: 0)
            .navigationBarBackButtonHidden()
        
            .onReceive(timer) { _ in
                if counter == 0 {
                    questionShowing = 1.0
                }
                if twoSec == 0 {
                    falseShowing = 0
                    trueShowing = 0
                    questionShowing = 1.0
                }
                offsetY += 2
                if offsetY >= geometry.size.height {
                    offsetY = 0
                    currentQuestion += 1
                }
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
