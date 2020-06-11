//
//  ThemesListViewModel.swift
//  MemorizeApp
//
//  Created by Maryan on 11.06.2020.
//  Copyright © 2020 Maryan. All rights reserved.
//

import Foundation

class ThemesListViewModel {
    
    let dataArray: [ThemeModel] = [ThemeModel(type: .faces),
                                   ThemeModel(type: .flags),
                                   ThemeModel(type: .food),
                                   ThemeModel(type: .halloween),
                                   ThemeModel(type: .places),
                                   ThemeModel(type: .vehicles)]
    
}
