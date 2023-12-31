//
//  ContentView.swift
//  Stanford_Swift_UI_01
//
//  Created by Haldox on 29/12/2023.
//

import SwiftUI

struct ContentView: View {
    let emojis: Array<String> = ["👻", "🎃", "🕷️", "🧟‍♀️"]
    
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
            // Since you can't have a tradition for loop in this View Struct
            // This is the substitue function
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
            }
        }
        .foregroundStyle(.indigo)
        .padding()
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = true
    
    var body: some View {
            ZStack {
                let base = RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                if isFaceUp {
                    base.foregroundStyle(.white)
                    base.strokeBorder(lineWidth: 5.0)
                    Text(content)
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
