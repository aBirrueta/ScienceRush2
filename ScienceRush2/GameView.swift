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
    let question = ["what is the power house of the cell"]
    let wrongAnswers = ["cellwall"]
    let correctAnswers = ["mitocondria"]
    var playersAnswers = [""]
    
    let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()

    func gradeAnswer() -> Bool {
        if playerAnswer == correctAnswers[currentQuestion] {
            return true
        }
        else {
            return false
        }
    } //closing gradeAnswer
    func multiChoice {
        
    }//multiChoice
    
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
