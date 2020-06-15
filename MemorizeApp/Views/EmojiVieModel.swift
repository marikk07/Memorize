//
//  EmojiVieModel.swift
//  MemorizeApp
//
//  Created by Maryan on 02.06.2020.
//  Copyright © 2020 Maryan. All rights reserved.
//

import SwiftUI

class EmojiVieModel: ObservableObject {
    
    @Published private var model: MemoryGameModel<String>
    
    private var theme: ThemeModel
    
    private let themeService = ThemeService()
    
    private static func createMemoryGame(with theme: ThemeModel) -> MemoryGameModel<String> {
        let dataArray = theme.type.dataArray.shuffled()
        return MemoryGameModel(pairsNumber: Int.random(in: 2...8)) { pairIndex in
            return dataArray[pairIndex]
        }
    }
    
    init(theme: ThemeModel) {
        self.theme = theme
        self.model = EmojiVieModel.createMemoryGame(with: theme)
    }
    
    var cards: [MemoryGameModel<String>.Card] {
        model.cards
    }
    
    var title: String {
        switch theme.type {
        case .faces: return "Faces"
        case .flags: return "Flags"
        case .food: return "Food"
        case .halloween: return "Halloween"
        case .places: return "Places"
        case .vehicles: return "Vehicles"
        }
    }
    
    var color: Color {
        switch theme.type {
        case .faces: return .yellow
        case .flags: return .blue
        case .food: return .green
        case .halloween: return .orange
        case .places: return .pink
        case .vehicles: return .red
        }
    }
    
    func selectCard(card: MemoryGameModel<String>.Card) {
        model.selectCard(card)
    }
    
    func resetGame() {
        model = EmojiVieModel.createMemoryGame(with: theme)
    }
    
    func newRandomGame() {
        theme = themeService.getRandomTheme()
        model = EmojiVieModel.createMemoryGame(with: theme)
    }
}
