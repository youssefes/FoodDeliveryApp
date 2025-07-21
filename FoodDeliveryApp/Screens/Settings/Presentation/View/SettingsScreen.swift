//
//  SettingsScreen.swift
//  Created by Asset's Macbook Pro on 21/07/2025.
//  Copyright © 2025 youssef. All rights reserved.

import SwiftUI

struct SettingsScreen: View {
    @StateObject var viewModel = SettingsViewModel()
    @EnvironmentObject var coordinator: AppCoordinator
    @State var name : String = "Profile".localized
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    var body: some View {
        ZStack{
            VStack {
                VStack(alignment: .leading){
                    HStack(alignment: .center){
                        ZStack(alignment: .bottomTrailing) {
                            AsyncImageView(url: URL(string: viewModel.profileImage))
                                .frame(width: Dimensions.d60, height: Dimensions.d60)
                                .cornerRadius(Dimensions.d30)
                            Button {
                                viewModel.showSelectImage.toggle()
                            } label: {
                                Image("camera")
                                    .resizable()
                                    .frame(width: Dimensions.d14, height: Dimensions.d14)
                                    .padding(Dimensions.d10)
                                    .background(DesignSystem.Colors.main.color)
                                    .cornerRadius(Dimensions.d20)
                            }
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
            .padding()
        }
        .toolbar(.hidden, for: .navigationBar)
        .onAppear(perform: {
        })
    }
}

#Preview {
    SettingsScreen()
}
