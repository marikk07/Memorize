//
//  ThemeRowViewModel.swift
//  MemorizeApp
//
//  Created by Maryan on 11.06.2020.
//  Copyright © 2020 Maryan. All rights reserved.
//

import SwiftUI

class ThemeRowViewModel {
    let model: ThemeModel
    
    var color: Color {
        switch model.type {
        case .faces: return .yellow
        case .flags: return .blue
        case .food: return .green
        case .halloween: return .orange
        case .places: return .pink
        case .vehicles: return .red
        }
    }
    
    var title: String {
        switch model.type {
        case .faces: return "Faces"
        case .flags: return "Flags"
        case .food: return "Food"
        case .halloween: return "Halloween"
        case .places: return "Places"
        case .vehicles: return "Vehicles"
        }
    }
    
    var subTitle: String {
        var str = ""
        for data in model.type.dataArray {
            str += data
        }
        
        return str
    }
    
    init(_ model: ThemeModel) {
        self.model = model
    }
}
