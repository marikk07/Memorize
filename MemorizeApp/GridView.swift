//
//  GridView.swift
//  MemorizeApp
//
//  Created by Maryan on 04.06.2020.
//  Copyright © 2020 Maryan. All rights reserved.
//

import SwiftUI

struct GridView<Item, ItemView>: View where Item: Identifiable, ItemView: View {
   private var items: [Item]
   private var viewForItem: (Item) -> ItemView
    
    init(_ items: [Item], viewForItem: @escaping (Item) -> ItemView) {
        self.items = items
        self.viewForItem = viewForItem
    }
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: GridLayout(itemCount: self.items.count, in: geometry.size))
        }
    }
    
  private func body(for layout: GridLayout) -> some View {
        ForEach(items) { item in
            self.body(for: item, layout: layout)
        }
    }
    
   private func body(for item: Item, layout: GridLayout) -> some View {
        let index = items.firstIndex(where: {$0.id == item.id})
        return Group {
            if index != nil {
                viewForItem(item)
                    .frame(width: min(layout.itemSize.height, layout.itemSize.width) * 2/3, height: min(layout.itemSize.height, layout.itemSize.width))
                    .position(layout.location(ofItemAt: index!))
            }
        }
    }
}
