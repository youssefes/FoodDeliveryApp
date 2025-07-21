//
//  SettingsScreen.swift
//  Created by Asset's Macbook Pro on 21/07/2025.
//  Copyright © 2025 youssef. All rights reserved.

import SwiftUI

struct SettingsScreen: View {
    @StateObject var viewModel = SettingsViewModel()
    @EnvironmentObject var coordinator: AppCoordinator
    
    var body: some View {
        BaseView(state: $viewModel.state) {
            contentView
        }
    }
    
    var contentView: some View {
        ZStack{
            VStack {
                topView
                menuItems
            }
            .padding()
        }
        .toolbar(.hidden, for: .navigationBar)
        .task {
            await viewModel.getProfile()
        }
    }
    
    var topView: some View {
        VStack(alignment: .leading){
            HStack(alignment: .center){
                ZStack(alignment: .bottomTrailing) {
                    AsyncImageView(url: URL(string: viewModel.profileImage))
                        .frame(width: Dimensions.d60, height: Dimensions.d60)
                        .cornerRadius(Dimensions.d30)
                }
                Spacer()
                Button {
                    coordinator.pop()
                } label: {
                    Image("Exit")
                        .resizable()
                        .frame(width:Dimensions.d16 ,height: Dimensions.d16)
                }
            }
            Text(viewModel.userName)
                .font(.custom(AppFont.medium.name, size: Dimensions.d20))
        }
        .padding()
    }
    
    var menuItems: some View {
        ScrollView(showsIndicators: false) {
            ForEach(0..<viewModel.profileItems.count, id: \.self) { index in
                if viewModel.profileItems[index].logOut {
                    Button {
                      
                    } label: {
                        MenuView(iconName: viewModel.profileItems[index].image, name: viewModel.profileItems[index].name, isLogOut: viewModel.profileItems[index].logOut,language: viewModel.profileItems[index].langauge)
                            .tint(.black)
                            .background()
                            .cornerRadius(Dimensions.d8)
                            .padding(.bottom, Dimensions.d5)
                    }
                }else{
                    Button {
                        switch index {
                        case 0:
                            print(viewModel.profileItems[index].name)
                        case 1:
                            print(viewModel.profileItems[index].name)
                        case 2:
                            print(viewModel.profileItems[index].name)
                        case 3:
                            print(viewModel.profileItems[index].name)
                          
                        default:
                            print(viewModel.profileItems[index].name)
                        }
                    } label: {
                        MenuView(iconName: viewModel.profileItems[index].image, name: viewModel.profileItems[index].name, isLogOut: viewModel.profileItems[index].logOut,language: viewModel.profileItems[index].langauge)
                            .tint(.black)
                            .background()
                            .cornerRadius(8)
                    }
                }
            }
        }
    }
}

#Preview {
    SettingsScreen()
}
