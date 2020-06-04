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
       
    
    static func createMemoryGame() -> MemoryGameModel<String> {
        let emojiArray = ["🥑", "🍉", "🍇"]
        return MemoryGameModel(pairsNumber: emojiArray.count) { pairIndex in
            return emojiArray[pairIndex]
        }
    }
    
    var cards: [MemoryGameModel<String>.Card] {
        model.cards
    }
    
    func selectCard(card: MemoryGameModel<String>.Card) {
        model.selectCard(card)
    }
}
