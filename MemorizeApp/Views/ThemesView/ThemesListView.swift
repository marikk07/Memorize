//
//  ThemesView.swift
//  MemorizeApp
//
//  Created by Maryan on 11.06.2020.
//  Copyright © 2020 Maryan. All rights reserved.
//

import SwiftUI

struct ThemesListView: View {
    
    let viewModel = ThemesListViewModel()
    
    var body: some View {
        return NavigationView {
            List(viewModel.getThemes()) { data in
                NavigationLink(destination: EmojiGameView(viewModel: EmojiVieModel(theme: data))) {
                     ThemeRowView(viewModel: ThemeRowViewModel(data))
                }
            }.navigationBarTitle("Themes")
        }
    }
}

struct ThemesView_Previews: PreviewProvider {
    static var previews: some View {
        ThemesListView()
    }
}
