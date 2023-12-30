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
    var isFaceUp: Bool = false
    
    var body: some View {
        if isFaceUp {
            ZStack {
                RoundedRectangle(cornerRadius: 25.0)
                    .foregroundStyle(.white)
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                    .strokeBorder(lineWidth: 5.0)
                Text("👻")
                    .font(.largeTitle)
            }
            .foregroundStyle(.indigo)
        } else {
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
        }
    }
}

#Preview {
    ContentView()
}
