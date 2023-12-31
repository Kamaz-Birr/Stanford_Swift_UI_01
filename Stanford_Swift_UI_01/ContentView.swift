//
//  ContentView.swift
//  Stanford_Swift_UI_01
//
//  Created by Haldox on 29/12/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        // The VStack function returns a TupleView ie Views in a Tuple data type
        // The VStack function below specifically returns a tuple with 2 items; Image & text
        // The @ViewBuilder turns the list of views into a TupleView
//        VStack(content: {
            // The functions .imageScale() & .foregroundStyle() are called View modifiers and they return a View
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            RoundedRectangle(cornerRadius: 25.0)
//                .foregroundStyle(.white)
//        })
//        .padding()
        
        HStack {
            CardView()
            CardView(isFaceUp: true)
        }
        .foregroundStyle(.indigo)
        .padding()
    }
}

struct CardView: View {
    @State var isFaceUp = false
    
    var body: some View {
            ZStack {
                let base = RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                if isFaceUp {
                    base.foregroundStyle(.white)
                    base.strokeBorder(lineWidth: 5.0)
                    Text("👻")
                        .font(.largeTitle)
                } else {
                    base.fill()
                }
            }
            .foregroundStyle(.indigo)
            .onTapGesture {
                isFaceUp.toggle()
                
                // Below is the same as the above
//                isFaceUp = !isFaceUp
            }
    }
}

#Preview {
    ContentView()
}
