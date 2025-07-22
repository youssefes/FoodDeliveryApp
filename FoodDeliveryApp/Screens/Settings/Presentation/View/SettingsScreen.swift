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
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    coordinator.pop()
                }) {
                    HStack(spacing: 20){
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black) // arrow color
                        Text("Settings")
                            .font(.custom(AppFont.bold.name, size: 24))
                            .foregroundStyle(.black)
                    }
                }
            }
        }
        .background(.white)
        .task {
            viewModel.getProfile()
        }
    }
    
    var topView: some View {
        VStack(alignment: .leading){
            HStack{
                AsyncImageView(url: URL(string: viewModel.profileImage))
                    .frame(width: Dimensions.d60, height: Dimensions.d60)
                    .cornerRadius(Dimensions.d30)
                Spacer()
            }
            Text(viewModel.userName)
                .font(.custom(AppFont.medium.name, size: Dimensions.d20))
        }
        .padding(.horizontal)
        .padding(.bottom)
    }
    
    var menuItems: some View {
        ScrollView(showsIndicators: false) {
            ForEach(0..<viewModel.profileItems.count, id: \.self) { index in
                if viewModel.profileItems[index].logOut {
                    Button {
                        UserUtilites.deleteUser()
                        coordinator.resetTo(.start)
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
                        case 1:
                            coordinator.navigate(to: .editProfile)
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
