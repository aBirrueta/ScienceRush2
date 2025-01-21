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
    @State var playerAnswer = ""
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

    func gradeAnswer() -> Bool { //function determines if question right or wrong
        if playerAnswer == correctAnswers[currentQuestion] {
            return true
        }
        else {
            return false
        }
    } //closing gradeAnswer
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                Image("sky background loop").navigationBarBackButtonHidden()
                    .scaledToFill()
                    .offset(y: offsetY)
                    .clipped()
                Image("sky background loop")
                    .scaledToFill()
                    .offset(y: offsetY-2000)
                    .clipped()
            }
            .onReceive(timer) { _ in
                offsetY += 2
                if offsetY >= geometry.size.height {
                    offsetY = 0
                }
            }
        }
        .edgesIgnoringSafeArea(.all)

    }
}
#Preview {
    GameView()
}
