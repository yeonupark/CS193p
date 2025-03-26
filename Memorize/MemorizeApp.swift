//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Yeonu Park on 2025/03/04.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
