//
//  Cardify.swift
//  MemorizeApp
//
//  Created by Maryan on 06.06.2020.
//  Copyright © 2020 Maryan. All rights reserved.
//

import SwiftUI

struct Cardify: AnimatableModifier {
    
    private let cornerRadius: CGFloat = 10
    private let edgeLineWidth: CGFloat = 3
    
    var rotation: Double
    
    var isFaceUp: Bool {
        rotation < 90
    }
    
    var animatableData: Double {
        get { rotation }
        set { rotation = newValue }
    }
    
    init(isFaceUp: Bool) {
        rotation = isFaceUp ? 0 : 180
    }
    
    func body(content: Self.Content) -> some View {
        ZStack {
            Group {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                content
            }.opacity(isFaceUp ? 1 : 0)
            RoundedRectangle(cornerRadius: self.cornerRadius).fill().opacity(isFaceUp ? 0 : 1)
        }.rotation3DEffect(Angle(degrees: rotation ), axis: (x: 0, y: 1, z: 0))
    }
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
