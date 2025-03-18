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
    @Binding var playerAnswer : String
    @Binding var answersOffSetY: Double
    @Binding var xOffset: Double 
    @State private var q1HitBox: CGRect = .zero
    @State private var q2HitBox: CGRect = .zero
    @State private var q3HitBox: CGRect = .zero
    @State private var q4HitBox: CGRect = .zero
    
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
    func checkColision(){
        if answersOffSetY == 1114.5{
            if xOffset == -132.0{playerAnswer = answers[currentLevel][currentQuestion][0]}
            if xOffset == -44.0{playerAnswer = answers[currentLevel][currentQuestion][1]}
            if xOffset == 44.0{playerAnswer = answers[currentLevel][currentQuestion][2]}
            if xOffset == 132.0{playerAnswer = answers[currentLevel][currentQuestion][3]}
        }
    }
    var body: some View {
        ZStack{
            HStack(spacing: 0){
                //Q1
                ZStack{
                    RoundedRectangle(cornerRadius: 25)
                            .fill(.red.opacity(0.5))
                            .frame(width: (UIScreen.main.bounds.size.width-50)/4, height: (UIScreen.main.bounds.size.width-50)/4)
                        Text(answers[currentLevel][currentQuestion][0])
                        .fontWeight(.bold)
                    }
                    .frame(width: (UIScreen.main.bounds.size.width-50)/4)
                    .onChange(of: answersOffSetY){checkColision()}
                //Q2
                ZStack{
                    RoundedRectangle(cornerRadius: 25)
                        .fill(.yellow.opacity(0.5))
                            .frame(width: (UIScreen.main.bounds.size.width-50)/4, height: (UIScreen.main.bounds.size.width-50)/4)
                        Text(answers[currentLevel][currentQuestion][1])
                        .fontWeight(.bold)

                    }
                    .frame(width: (UIScreen.main.bounds.size.width-50)/4)
                //Q3
                ZStack{
                    RoundedRectangle(cornerRadius: 25)
                        .fill(.blue.opacity(0.5))
                            .frame(width: (UIScreen.main.bounds.size.width-50)/4, height: (UIScreen.main.bounds.size.width-50)/4)
                        Text(answers[currentLevel][currentQuestion][2])
                        .fontWeight(.bold)

                    }
                    .frame(width: (UIScreen.main.bounds.size.width-50)/4)
                //Q4
                ZStack{
                    RoundedRectangle(cornerRadius: 25)
                        .fill(.green.opacity(0.5))
                            .frame(width: (UIScreen.main.bounds.size.width-50)/4, height: (UIScreen.main.bounds.size.width-50)/4)
                        Text(answers[currentLevel][currentQuestion][3])
                        .fontWeight(.bold)

                    }
                    .frame(width: (UIScreen.main.bounds.size.width-50)/4)
                /*
                Button(answers[currentLevel][currentQuestion][0]) {
                    playerAnswer = answers[currentLevel][currentQuestion][0]
                }
                .buttonBorderShape(.capsule)
                .buttonStyle(.borderedProminent)
                
                        
                Button(answers[currentLevel][currentQuestion][1]) {
                    playerAnswer = answers[currentLevel][currentQuestion][1]
                }
                .buttonBorderShape(.capsule)
                .buttonStyle(.borderedProminent)
                
                
                Button(answers[currentLevel][currentQuestion][2]) {
                    playerAnswer = answers[currentLevel][currentQuestion][2]
                }
                .buttonBorderShape(.capsule)
                .buttonStyle(.borderedProminent)
                
                
                Button(answers[currentLevel][currentQuestion][3]) {
                    playerAnswer = answers[currentLevel][currentQuestion][3]
                }
                .buttonBorderShape(.capsule)
                .buttonStyle(.borderedProminent)
                .onChange(of: answersOffSetY){checkColision()}
                */
                
            }//hstack
        }
    }
    
    /*
     #Preview {
     AnswerView()
     }*/
}
