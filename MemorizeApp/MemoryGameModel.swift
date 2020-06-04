//
//  MemoryGameModel.swift
//  MemorizeApp
//
//  Created by Maryan on 02.06.2020.
//  Copyright © 2020 Maryan. All rights reserved.
//

import Foundation

struct MemoryGameModel<CardContent> where CardContent: Equatable {
    
    var cards: Array<Card>
    
    var indexOfTheOneFaceUpCard: Int? {
        get {
            let faceupCards = cards.indices.filter({ cards[$0].isFaceUp })
            return faceupCards.count == 1 ? faceupCards.first : nil
        }
        
        set {
            for index in cards.indices { cards[index].isFaceUp = index == newValue }
        }
    }
    
    init(pairsNumber: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        for index in 0..<pairsNumber {
            let content = cardContentFactory(index)
            cards.append(Card(content: content, id: index * 2) )
            cards.append(Card(content: content, id: index * 2 + 1))
        }
    }
    
    mutating func selectCard(_ card: Card) {
        guard let index = cards.firstIndex(where: {$0.id == card.id}),
            !cards[index].isFaceUp, !cards[index].isMatched else { return }
        
        if let indexOfTheOneFaceUpCard = indexOfTheOneFaceUpCard {
            if cards[index].content == cards[indexOfTheOneFaceUpCard].content {
                cards[index].isMatched = true
                cards[indexOfTheOneFaceUpCard].isMatched = true
            }
            cards[index].isFaceUp = true
        } else {
            indexOfTheOneFaceUpCard = index
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
