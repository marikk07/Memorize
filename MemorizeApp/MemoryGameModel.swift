//
//  MemoryGameModel.swift
//  MemorizeApp
//
//  Created by Maryan on 02.06.2020.
//  Copyright © 2020 Maryan. All rights reserved.
//

import Foundation

struct MemoryGameModel<CardContent> where CardContent: Equatable {
    
    private(set) var cards: Array<Card>
    
    private var indexOfTheOneFaceUpCard: Int? {
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
        cards.shuffle()
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
        var isFaceUp: Bool = false {
            didSet {
                isFaceUp ? startUsingBonusTime() :  stopUsingBonusTime()
            }
        }
        var isMatched: Bool = false {
            didSet { stopUsingBonusTime() }
        }
        
        var content: CardContent
        
        var id: Int
        
        var bonusTimeLimit: TimeInterval = 6
        
        var lastFaceUpDate: Date?
        
        var pastFaceUpTime: TimeInterval = 0
        
        private var faceUpTime: TimeInterval {
            if let lastFaceUpDate = lastFaceUpDate {
                return pastFaceUpTime + Date().timeIntervalSince(lastFaceUpDate)
            } else {
                return pastFaceUpTime
            }
        }
        
        var bonusTimeRemaining: TimeInterval {
            max(0, bonusTimeLimit - faceUpTime)
        }
        
        var bonusRemaining: Double {
            (bonusTimeLimit > 0 && bonusTimeRemaining > 0) ? bonusTimeRemaining/bonusTimeLimit : 0
        }
        
        var hasEarnedBonus: Bool {
            isMatched && bonusTimeRemaining > 0
        }
        
        var isConsumingBonusTime: Bool {
            isFaceUp && !isMatched && bonusTimeRemaining > 0
        }
        
        private mutating func startUsingBonusTime() {
            if isConsumingBonusTime, lastFaceUpDate == nil {
                lastFaceUpDate = Date()
            }
        }
        
        private mutating func stopUsingBonusTime() {
            pastFaceUpTime = faceUpTime
            lastFaceUpDate = nil
        }
    }
}
