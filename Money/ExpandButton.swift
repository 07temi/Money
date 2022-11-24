//
//  ExpandButton.swift
//  Money
//
//  Created by Артем Черненко on 24.11.2022.
//

import SwiftUI

struct ExpandableButtonPanel: View {
    
    let primaryItem: ExpandableButtonItem
    let secondaryItems: [ExpandableButtonItem]
    
    //  private let noop: () -> Void = {}
    private let size: CGFloat = 70                                            //размер кнопки
    private var cornerRadius: CGFloat {
        get { size / 2 }
    }
    private let shadowColor = Color.black.opacity(0.4)
    private let shadowPosition: (x: CGFloat, y: CGFloat) = (x: 2, y: 2)
    private let shadowRadius: CGFloat = 3
    
    @State private var isExpanded = false
    
    var body: some View {
        VStack {
            if isExpanded {
                ForEach(secondaryItems) { item in
                    Button(action: {item.action?()}, label: {item.label})
                        .frame(width: self.size, height: self.size)
                }
            }
            Button(action: { withAnimation{ self.isExpanded.toggle() }
                self.primaryItem.action?()}, label: {self.primaryItem.label})
                .frame(width: self.size, height: self.size)
        }
        .background(Color.purple)
        .cornerRadius(cornerRadius)
        .shadow(radius: 5)
    }
}
        
    struct ExpandableButtonItem: Identifiable {
        let id = UUID()
        let label: Image
        private (set) var action: (() -> Void)? = nil
    }
