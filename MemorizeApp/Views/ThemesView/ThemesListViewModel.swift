//
//  ThemesListViewModel.swift
//  MemorizeApp
//
//  Created by Maryan on 11.06.2020.
//  Copyright © 2020 Maryan. All rights reserved.
//

import Foundation

class ThemesListViewModel {
    
    let themeService = ThemeService()
    
    func getThemes() -> [ThemeModel] {
        themeService.getAllThemes()
    }
}
