//
//  MemoryGameModel.swift
//  MemorizeApp
//
//  Created by Maryan on 02.06.2020.
//  Copyright © 2020 Maryan. All rights reserved.
//

import Foundation

struct MemoryGameModel<CardContent> {
    
    var cards: Array<Card>
    
    init(pairsNumber: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        for index in 0..<pairsNumber {
            let content = cardContentFactory(index)
            cards.append(Card(content: content, id: index * 2))
            cards.append(Card(content: content, id: index * 2 + 1))
        }
    }
    
    mutating func selectCard(_ card: Card) {
        guard let index = cards.firstIndex(where: {$0.id == card.id}) else { return }
        cards[index].isFaceUp = !cards[index].isFaceUp
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
