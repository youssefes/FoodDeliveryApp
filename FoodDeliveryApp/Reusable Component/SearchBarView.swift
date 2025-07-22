//
//  SearchBarView.swift
//  FoodDeliveryApp
//
//  Created by Mader's Macbook Pro on 22/07/2025.
//

import SwiftUI
// Custom search bar view
struct SearchBarView: View {
    @Binding var text: String
    var body: some View {
        HStack {
            TextField("Search by name...", text: $text)
                .padding(Dimensions.d10)
                .padding(.horizontal, Dimensions.d25)
                .background(Color(.systemGray6))
                .cornerRadius(Dimensions.d8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: Dimensions.d0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, Dimensions.d8)
                        
                        if !text.isEmpty {
                            Button(action: {
                                self.text = ""
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, Dimensions.d8)
                            }
                        }
                    }
                )
        }
    }
}

#Preview {
    SearchBarView(text: .constant(""))
}
