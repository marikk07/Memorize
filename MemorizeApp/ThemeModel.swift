//
//  ThemeModel.swift
//  MemorizeApp
//
//  Created by Maryan on 11.06.2020.
//  Copyright © 2020 Maryan. All rights reserved.
//

import Foundation

enum ThemeModelType {
    case faces
    case flags
    case food
    case halloween
    case places
    case vehicles

    var dataArray: [String] {
        switch self {
        case .faces: return ["😀", "😃", "😄", "😂", "😎", "😝", "🥳", "😡" , "🤪", "🤓", "🤩", "🧐"]
        case .flags: return ["🏁", "🇺🇳", "🏳️‍🌈", "🇬🇷", "🇭🇰", "🇬🇬", "🇺🇸", "🇷🇪", "🇸🇸", "🇹🇭", "🇹🇴", "🇹🇲", "🇺🇬"]
        case .food: return ["🍏", "🍎", "🍐", "🍊", "🍇", "🍉", "🍌", "🥥", "🥝", "🥦", "🌽", "🥔", "🧅", "🥕"]
        case .halloween: return ["🎃", "🐜", "🕸", "🕷", "🦇", "🐗", "🦟", "🐍", "🦂", "🌙", "🌘"]
        case .places: return ["🗽", "🗼", "🎢", "🏰", "🎠", "🏔", "🏦", "🏥", "🏬", "🏚", "⛺️" ]
        case .vehicles: return ["🚗", "🚌", "🚓", "🏎", "🚛", "🚎", "🚜", "🚆", "🚠", "🚖", "🚔", "🛵", "🏍", "🦼"]
        }
    }
}

struct ThemeModel: Identifiable {
    let id: String = UUID().uuidString
    
    let type: ThemeModelType
}

