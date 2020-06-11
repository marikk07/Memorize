//
//  ThemeRowView.swift
//  MemorizeApp
//
//  Created by Maryan on 11.06.2020.
//  Copyright © 2020 Maryan. All rights reserved.
//

import SwiftUI

struct ThemeRowView: View {
    
    let viewModel: ThemeRowViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(viewModel.title).font(.largeTitle)
                .foregroundColor(viewModel.color).padding(5)
            Text(viewModel.subTitle)
        }
    }
}

struct ThemeRowView_Previews: PreviewProvider {
    static var previews: some View {
        let facesViewModel = ThemeRowViewModel(ThemeModel(type:.faces))
        let vehiclesViewModel = ThemeRowViewModel(ThemeModel(type: .vehicles))
        return Group {
            ThemeRowView(viewModel: facesViewModel)
            ThemeRowView(viewModel: vehiclesViewModel)
        }.previewLayout(.fixed(width: 300, height: 70))
    }
}
