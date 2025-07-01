//  SearchNavigationBarView.swift
//  Created by Asset's Macbook Pro on 01/07/2025.
//  Copyright © 2025 youssef. All rights reserved.

import SwiftUI

struct ShowProgressView: View {
    var body: some View {
        ZStack {
            Color.black
                .opacity(0.75)
                .ignoresSafeArea()
        }
        VStack{
            Spacer()
            ProgressView()
                .progressViewStyle(.circular)
                .tint(.white)
                .scaleEffect(1)
            Spacer()
        }
    }
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView()
    }
}
