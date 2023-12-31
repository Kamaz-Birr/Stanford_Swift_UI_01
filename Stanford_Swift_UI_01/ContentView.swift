//
//  ContentView.swift
//  Stanford_Swift_UI_01
//
//  Created by Haldox on 29/12/2023.
//

import SwiftUI

struct ContentView: View {
    let emojis: Array<String> = ["👻", "🎃", "🕷️", "🧟‍♀️", "👹", "🧙🏿‍♂️", "👺", "🧌", "🦇", "🥷🏿", "🧜🏿‍♂️", "🧚🏿‍♀️"]
    @State var cardCount: Int = 4
    
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
        
        VStack {
            ScrollView {
                cards
            }
            Spacer()
            cardCounter
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
            // Since you can't have a tradition for loop in this View Struct
            // This is the substitue function
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundStyle(.indigo)
    }
    
    var cardCounter: some View {
        HStack {
            cardAdder
            Spacer()
            cardRemover
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button {
            cardCount += offset
        } label: {
            Image(systemName: symbol)
        }
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)

    }
    
    var cardAdder: some View {
        return cardCountAdjuster(by: 1, symbol: "rectangle.stack.fill.badge.plus")
    }
    
    var cardRemover: some View {
        return cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus")
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = true
    
    var body: some View {
            ZStack {
                let base = RoundedRectangle(cornerRadius: 10.0)
                Group {
                    base.foregroundStyle(.white)
                    base.strokeBorder(lineWidth: 2.5)
                    Text(content)
                        .font(.largeTitle)
                }
                .opacity(isFaceUp ? 1 : 0)
                base.fill().opacity(isFaceUp ? 0 : 1)
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
