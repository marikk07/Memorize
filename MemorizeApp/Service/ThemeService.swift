//
//  ThemeService.swift
//  MemorizeApp
//
//  Created by Maryan on 15.06.2020.
//  Copyright © 2020 Maryan. All rights reserved.
//

import Foundation

class ThemeService {
   private let dataArray: [ThemeModel] = [ThemeModel(type: .faces),
                                          ThemeModel(type: .flags),
                                          ThemeModel(type: .food),
                                          ThemeModel(type: .halloween),
                                          ThemeModel(type: .places),
                                          ThemeModel(type: .vehicles)]
    
    func getAllThemes() -> [ThemeModel] {
        dataArray
    }
    
    func getRandomTheme() -> ThemeModel {
        let index = Int.random(in: 0..<dataArray.count)
        debugPrint("\(index)")
        return dataArray[index]
    }
}
