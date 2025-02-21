//
//  EndGameView.swift
//  ScienceRush2
//
//  Created by Alejandro Birrueta on 2/4/25.
//

import SwiftUI

struct EndGameView: View {
    
    @Binding var currentLevel: Int
    let correctAnswers =
    [
        ["Cell","Nucleus","Mitochondria","Cell membrane","Chloroplast","Cytoplasm","Ribosome","Golgi apparatus","Cell wall","To store water and nutrients","To break down waste materials","Smooth Endoplasmic Reticulum","To provide structure and support","Prokaryotic and Eukaryotic","To control what enters and exits the cell"]
    ]
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 15)
                .fill(.white)
                .frame(width: 350, height: 550)
            VStack{
                Text("Level 1")
                Text("score:")
                HStack{
                    Text("Question 1: ")
                }
                
                
            }
            
        }
        
    }
}
/*
#Preview {
    EndGameView()
}
*/
