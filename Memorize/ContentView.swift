//
//  ContentView.swift
//  Memorize
//
//  Created by Yeonu Park on 2025/03/04.
//

import SwiftUI

enum Theme: CaseIterable {
    
    case animals
    case fruits
    case nature
    
    var symbol: String {
        switch self {
        case .animals:
            "pawprint.fill"
        case .fruits:
            "carrot"
        case .nature:
            "globe.asia.australia.fill"
        }
    }
    
    var label: String {
        switch self {
        case .animals:
            "Animals"
        case .fruits:
            "Fruits"
        case .nature:
            "Nature"
        }
    }
    
    var emojis: [String] {
        switch self {
        case .animals: ["🐤","🐻","🐠","🐙","🐌","🦖","🐤","🐻","🐠","🐙","🐌","🦖"]
        case .fruits: ["🥝","🍒","🥭","🍑","🍉","🍓","🍇","🍏","🥝","🍒","🥭","🍑","🍉","🍓","🍇","🍏"]
        case .nature: ["🌍","🪐","🌚","⭐️","☄️","🌕","💫","🌍","🪐","🌚","⭐️","☄️","🌕","💫"]
        }
    }
    
    var colors: Color {
        switch self {
        case .animals:
            Color(.brown)
        case .fruits:
            Color(.orange)
        case .nature:
            Color(.green)
        }
    }
}

struct ContentView: View {
    
    @State var selectedTheme: Theme = .animals
    @State var selectedEmojis: [String] = Theme.animals.emojis.shuffled()
    
    var body: some View {
        VStack {
            title
            ScrollView {
                cards
            }
            Spacer()
            themeSelecter
        }
        .padding()
    }
    
    var title: Text {
        Text("Memorize!")
            .font(.largeTitle)
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 60))]) {
            ForEach(selectedEmojis.indices, id: \.self) { index in
                CardView(content: selectedEmojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(selectedTheme.colors)
    }
    
    func themeButtonBuilder(theme: Theme) -> some View {
        Button(action: {
            selectedTheme = theme
            selectedEmojis = theme.emojis.shuffled()
        }, label: {
            VStack{
                Image(systemName: theme.symbol)
                    .imageScale(.large)
                    .font(.title3)
                Text(theme.label)
                    .font(.footnote)
            }
        })
    }
    
    var themeSelecter: some View {
        HStack(spacing: 50) {
            themeButtonBuilder(theme: .animals)
            themeButtonBuilder(theme: .fruits)
            themeButtonBuilder(theme: .nature)
        }
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
