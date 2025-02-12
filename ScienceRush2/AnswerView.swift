//
//  AnswerView.swift
//  ScienceRush2
//
//  Created by Alejandro Birrueta on 2/11/25.
//

 
import SwiftUI

struct AnswerView: View {
    //@State var questionsAnswered = 0
    //@Binding var currentLevel = 0
    //@Binding var currentQuestion = 0
    //@State var questionShowing = 0.0
    //@State var trueShowing = 0.0
    //@State var falseShowing = 0.0
    //@State var gameRunning = true
    
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
                    gradeAnswer(playerAnswer: answers[currentLevel][currentQuestion][0])
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
        .frame(maxWidth: .infinity, maxHeight: .infinity)    }    }
}

#Preview {
    AnswerView()
}
