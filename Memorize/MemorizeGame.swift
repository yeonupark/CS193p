//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Yeonu Park on 2025/03/09.
//

import Foundation

struct MemorizeGame<CardContent> {
    
    var cards: Array<Card>
    
    func choose(card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        let content: CardContent
        
    }
}
