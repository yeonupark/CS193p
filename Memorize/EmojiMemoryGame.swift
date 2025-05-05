//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Yeonu Park on 2025/03/09.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    private static let themes = [
        Theme(name: "Animals", emoji: ["🐤", "🐻", "🐠", "🐙", "🐌", "🦖", "🦉", "🦊"], numberOfPairsOfCards: 9, color: .yellow),
        Theme(name: "Fruits", emoji: ["🍎", "🍌", "🍇", "🍉", "🍒", "🥝", "🍍", "🍓"], numberOfPairsOfCards: 10, color: .orange),
        Theme(name: "Weather", emoji: ["🌞", "🌧️", "⛈️", "❄️", "🌪️", "🌈", "🌤️", "🌫️"], numberOfPairsOfCards: 10, color: .blue),
        Theme(name: "Transport", emoji: ["🚗", "🚲", "✈️", "🚀", "🚂", "🛴", "🚁", "🛸"], numberOfPairsOfCards: 4, color: .pink),
        Theme(name: "Faces", emoji: ["😀", "😎", "😡", "😭", "😱", "🥳", "🤔", "😍"], numberOfPairsOfCards: 6, color: .purple),
        Theme(name: "Fantasy", emoji: ["🧙", "🧝", "🧛", "🧞", "🐉", "🦄", "👻", "🪄"], numberOfPairsOfCards: 5, color: .green)
    ]
    
    init() {
        theme = EmojiMemoryGame.themes.randomElement()!
        model = EmojiMemoryGame.createMemoryGame(theme)
        model.shuffle()
    }
    
    private static func createMemoryGame(_ theme: Theme) -> MemoryGame<String> {
        let shuffeldEmojis = theme.emoji.shuffled()
        return MemoryGame(numberOfPairsOfCards: theme.numberOfPairsOfCards) { pairIndex in
            if shuffeldEmojis.indices.contains(pairIndex) {
                return shuffeldEmojis[pairIndex]
            } else {
                return "⁉️"
            }
        }
    }
    
    private func selectTheme() -> Theme {
        return EmojiMemoryGame.themes.randomElement()!
    }
    
    
    @Published private var model: MemoryGame<String>
    private var theme: Theme
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    var score: Int {
        return model.score
    }
    
    var themeColor: ThemeColor {
        return theme.color
    }
    
    var themeName: String {
        return theme.name
    }
    
    // MARK: - Intents
    
    func restart() {
        theme = selectTheme()
        model = EmojiMemoryGame.createMemoryGame(theme)
        model.shuffle()
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
