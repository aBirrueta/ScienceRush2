//
//  GameView.swift
//  ScienceRush2
//
//  Created by Alejandro Birrueta on 1/9/25.
//

import SwiftUI

struct GameView: View {
    @Environment(\.dismiss) var dismiss
    @State var questionsAnswered = 0
    @State var currentLevel = 0
    @State var levelProgress = 0
    
    let question = ["what is the power house of the cell"]
    let possibleAnswers = ["mitocondria"]
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let playersAnswers = [""]
    
    var body: some View {
        Image("sky background loop").navigationBarBackButtonHidden()
            .onReceive(timer) {_ in 
                print("hello")
            }
    }
    
}

#Preview {
    GameView()
}
