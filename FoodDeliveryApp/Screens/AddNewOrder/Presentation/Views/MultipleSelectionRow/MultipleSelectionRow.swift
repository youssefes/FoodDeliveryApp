//
//  MultipleSelectionRow.swift
//  FoodDeliveryApp
//
//  Copyright © 2025 youssef. All rights reserved.
//

import SwiftUI
struct  MultipleSelectionRowModel: Equatable ,Identifiable {
    var id: String = UUID().uuidString
    var title: String
    var isSelected: Bool
}

struct MultipleSelectionRow: View {
    var Model: MultipleSelectionRowModel
    var action: () -> Void
    
    var body: some View {
        Button(action: self.action) {
            HStack {
                Text(Model.title)
                    .font(.custom(AppFont.light.name, size: 16))
                    .foregroundStyle(.black)
                Spacer()
                if Model.isSelected {
                    Image(systemName: "checkmark")
                        .foregroundColor(DesignSystem.Colors.main.color)
                }
            }
            .padding(16)
            .overlay(RoundedRectangle(cornerRadius: Dimensions.d8)
                .stroke(Model.isSelected ? DesignSystem.Colors.main.color : DesignSystem.Colors.borderColor.color, lineWidth:  Dimensions.d1)
            )
        }
    }
}

#Preview {
    MultipleSelectionRow(Model: MultipleSelectionRowModel(title: "", isSelected: true), action: {
        
    })
}
