//
//  EmojiGameView.swift
//  MemorizeApp
//
//  Created by Maryan on 30.05.2020.
//  Copyright © 2020 Maryan. All rights reserved.
//

import SwiftUI

struct EmojiGameView: View {
    
  @ObservedObject var viewModel: EmojiVieModel
    
    var body: some View {
        GridView(viewModel.cards) { card in
            CardView(card: card).onTapGesture {
                self.viewModel.selectCard(card: card)
            }
        .padding(5)
        }
        .padding()
        .foregroundColor(.orange)
    }
}

struct CardView: View {
    
    var card: MemoryGameModel<String>.Card
    
    let cornerRadius: CGFloat = 10
    let edgeLineWidth: CGFloat = 3
    let scaleFactor: CGFloat = 0.8
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    func body(for size: CGSize) -> some View {
        ZStack {
            if self.card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth).foregroundColor(.orange)
                Text(self.card.content) 
            } else {
                RoundedRectangle(cornerRadius: self.cornerRadius).foregroundColor(.orange)
            }
        }
        .font(Font.system(size: min(size.width, size.height) * scaleFactor))
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiGameView(viewModel: EmojiVieModel ())
    }
}
