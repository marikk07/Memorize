//
//  EmojiVieModel.swift
//  MemorizeApp
//
//  Created by Maryan on 02.06.2020.
//  Copyright © 2020 Maryan. All rights reserved.
//

import Foundation

class EmojiVieModel: ObservableObject {
    
   @Published private var model: MemoryGameModel<String> = createMemoryGame()
    
    private static func createMemoryGame() -> MemoryGameModel<String> {
        let emojiArray = ["🥑", "🍉", "🍇", "🧅", "🥦", "🌽", "🌶"].shuffled()
        return MemoryGameModel(pairsNumber: Int.random(in: 2...emojiArray.count)) { pairIndex in
            return emojiArray[pairIndex]
        }
    }
    
    var cards: [MemoryGameModel<String>.Card] {
        model.cards
    }
    
    func selectCard(card: MemoryGameModel<String>.Card) {
        model.selectCard(card)
    }
    
    func resetGame() {
        model = EmojiVieModel.createMemoryGame()
    }
}
