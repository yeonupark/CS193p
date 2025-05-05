//
//  Theme.swift
//  Memorize
//
//  Created by Yeonu Park on 5/4/25.
//

import Foundation

struct Theme {
    
    let name: String
    let emoji: Array<String>
    let numberOfPairsOfCards: Int
    let color: ThemeColor
    
}

enum ThemeColor: CaseIterable {
    case yellow
    case pink
    case orange
    case blue
    case green
    case purple
}
