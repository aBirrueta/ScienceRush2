//
//  GradeAnswerView.swift
//  ScienceRush2
//
//  Created by Alejandro Birrueta on 2/11/25.
//


 
import SwiftUI
struct GradeAnswerView: View {
 
    @Binding var trueShowing : Double
    @Binding var falseShowing : Double

    var body: some View {
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
    }
    
}


/*
 #Preview {
 GradeAnswerView()
 }
 */
