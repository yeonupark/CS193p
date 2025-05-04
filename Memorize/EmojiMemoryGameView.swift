//
//  ContentView.swift
//  Memorize
//
//  Created by Yeonu Park on 2025/03/04.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            title
            ScrollView {
                cards
                    .animation(.default, value: viewModel.cards)
            }
            Spacer()
            Button("New Game") {
                viewModel.restart()
            }
        }
        .padding()
    }
    
    var title: Text {
        Text(viewModel.themeName)
            .font(.largeTitle)
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0) {
            ForEach(viewModel.cards) { card in
                if !card.isMatched {
                    CardView(card, color: viewModel.themeColor)
                        .aspectRatio(2/3, contentMode: .fit)
                        .padding(4)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                }
            }
        }
    }
}

struct CardView: View {
    
    let card: MemoryGame<String>.Card
    let themeColor: Color
    
    init(_ card: MemoryGame<String>.Card, color: ThemeColor) {
        self.card = card
        
        switch color {
        case .yellow:
            themeColor = .yellow
        case .pink:
            themeColor = .pink
        case .orange:
            themeColor = .orange
        case .blue:
            themeColor = .blue
        case .green:
            themeColor = .green
        case .purple:
            themeColor = .purple
        }
    }
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
                .fill(card.isFaceUp ? .white : themeColor)
            Group {
                base.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            base.opacity(card.isFaceUp ? 0 : 1)
        }
    }
}

#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
