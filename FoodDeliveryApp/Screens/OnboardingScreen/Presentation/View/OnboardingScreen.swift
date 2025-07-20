//
//  OnboardingScreen.swift
//  Created by Asset's Macbook Pro on 20/07/2025.
//  Copyright © 2025 youssef. All rights reserved.

import SwiftUI
struct OnboardingScreen: View {
    @StateObject var viewModel = OnboardingViewModel()
    @StateObject var coordinator = AppCoordinator()
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            VStack {
                skipButton
                Spacer()
                tabBarView
                pageControlView
                Spacer()
                if viewModel.cureentStap == 2 {
                    MainButton(title: "Let’s Start") {
                        coordinator.navigate(to: .start)
                    }
                }
            }
            .padding()
            .CoordinatorDestination()
        }
        .environmentObject(coordinator)
        .onAppear{ }
    }
    
    var skipButton: some View {
        HStack(alignment: .top){
            Spacer()
            if viewModel.cureentStap != 2 {
                Button {
                    coordinator.navigate(to: .start)
                } label: {
                    Text("Skip")
                        .font(.custom(AppFont.medium.name, size: Dimensions.d16))
                        .foregroundColor(DesignSystem.Colors.main.color)
                        .padding()
                }
            }
            
        }
    }
    
    var tabBarView: some View {
        TabView(selection: $viewModel.cureentStap) {
            ForEach($viewModel.onBoardData.indices, id: \.self) { index in
                let item = $viewModel.onBoardData[index]
                VStack(spacing: Dimensions.d20) {
                    Image(item.wrappedValue.image)
                        .resizable()
                        .frame(width: Dimensions.d300, height: Dimensions.d300)
                    Text(item.wrappedValue.description)
                        .font(.custom(AppFont.medium.name, size: Dimensions.d20))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                }
                .tag(item.wrappedValue.id)
            }
            
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(height: Dimensions.d410)
    }
    
    var pageControlView: some View {
        HStack {
            ForEach(0..<viewModel.onBoardData.count, id: \.self) { index in
                if index == viewModel.cureentStap {
                    Rectangle()
                        .fill(DesignSystem.Colors.main.color)
                        .frame(width: Dimensions.d20,height: Dimensions.d4)
                }else{
                    Rectangle()
                        .fill(DesignSystem.Colors.borderColor.color)
                        .frame(width: Dimensions.d20,height: Dimensions.d4)
                }
            }
        }
    }
}

struct OnboardingScreen_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingScreen()
    }
}
