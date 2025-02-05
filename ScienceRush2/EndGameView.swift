//
//  EndGameView.swift
//  ScienceRush2
//
//  Created by Alejandro Birrueta on 2/4/25.
//

import SwiftUI

struct EndGameView: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 15)
                .fill(.white)
                .frame(width: 300, height: 500)
            Text("score:")
        }

    }
}

#Preview {
    EndGameView()
}
