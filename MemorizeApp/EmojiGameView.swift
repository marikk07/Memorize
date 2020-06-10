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
        VStack {
            GridView(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    withAnimation(.easeIn(duration: 1.2)) { self.viewModel.selectCard(card: card) }
                }.padding(5)
            }
            Button("Reset") {
                withAnimation { self.viewModel.resetGame() }
            }
        }
        .padding()
        .foregroundColor(.orange)
    }
}

struct CardView: View {
    
    private let scaleFactor: CGFloat = 0.6
    
    var card: MemoryGameModel<String>.Card
       
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    @State private var animatedBonusRemaing: Double = 0
    
    private func startBonusTimeAnimation() {
        animatedBonusRemaing = card.bonusRemaining
        withAnimation(.linear(duration: card.bonusTimeRemaining)) {
            animatedBonusRemaing = 0
        }
    }
    
    @ViewBuilder
    private func body(for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched {
            ZStack {
                if card.isConsumingBonusTime {
                    Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(-animatedBonusRemaing*360-90))
                    .padding(5).opacity(0.4)
                    .onAppear {
                        self.startBonusTimeAnimation()
                    }
                } else {
                    Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(-card.bonusRemaining*360-90))
                    .padding(5).opacity(0.4)
                }
                Text(self.card.content)
                .font(Font.system(size: min(size.width, size.height) * scaleFactor))
                .rotationEffect(Angle(degrees: card.isMatched ? 360 : 0))
                .animation(card.isMatched ? Animation.linear(duration: 1).repeatForever(autoreverses: false) : .default)
            }
                .cardify(isFaceUp: card.isFaceUp)
                .transition(AnyTransition.scale)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let model = EmojiVieModel()
        model.selectCard(card: model.cards[0])
        return EmojiGameView(viewModel: model)
    }
}
