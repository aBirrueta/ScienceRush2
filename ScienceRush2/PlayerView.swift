//
//  PlayerView.swift
//  ScienceRush2
//
//  Created by Alejandro Birrueta on 3/5/25.
//

import SwiftUI

struct PlayerView: View {
    @State private var offset = CGSize.zero
    var body: some View {
        Image("rocket")
            .resizable()
               .frame(width: 100, height: 100)
               .aspectRatio(contentMode: .fit)
               .offset(offset)
               .gesture(
                   DragGesture()
                       .onChanged { gesture in
                           offset = gesture.translation
                       }
                   )
    }
}

#Preview {
    PlayerView()
}
