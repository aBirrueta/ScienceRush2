//
//  AnswerView.swift
//  ScienceRush2
//
//  Created by Alejandro Birrueta on 2/11/25.
//

 
import SwiftUI

struct AnswerView: View {
    @Binding var currentLevel : Int
    @Binding var currentQuestion : Int
    @State var playerAnswer = ""
    
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
    var body: some View {

            HStack{
                Button(answers[currentLevel][currentQuestion][0]) {
                    playerAnswer = answers[currentLevel][currentQuestion][0]
                    GradeAnswerView(playerAnswer: $playerAnswer)
                }
                .buttonBorderShape(.capsule)
                .buttonStyle(.borderedProminent)
                Button(answers[currentLevel][currentQuestion][1]) {
                    playerAnswer = answers[currentLevel][currentQuestion][1]
                    //GradeAnswerView(playerAnswer)
                 }
                .buttonBorderShape(.capsule)
                .buttonStyle(.borderedProminent)
                Button(answers[currentLevel][currentQuestion][2]) {
                    playerAnswer = answers[currentLevel][currentQuestion][2]
                    //GradeAnswerView(playerAnswer)

                }
                .buttonBorderShape(.capsule)
                .buttonStyle(.borderedProminent)
                Button(answers[currentLevel][currentQuestion][3]) {
                    playerAnswer = answers[currentLevel][currentQuestion][3]
                    //GradeAnswerView(playerAnswer)
                }
                .buttonBorderShape(.capsule)
                .buttonStyle(.borderedProminent)
            }//hstack
            //.opacity(questionShowing)
            //.offset(y: answersOffSetY-geometry.size.height)
    }
}

/*
#Preview {
    AnswerView()
 }*/
