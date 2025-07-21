//
//  InputView.swift
//  Created by Asset's Macbook Pro on 20/07/2025.
//  Copyright © 2025 youssef. All rights reserved.

import SwiftUI
struct InputView: View {
    @Binding var  text: String
    @State var  isSecured: Bool = false
    @State private var  validatedError : String = ""
    @Binding var validated: Bool 
    @State var showBoarder: Bool = true
    @State var removeFocus: Bool = false
    @State var showErrorBorder: Bool = false
    var keywordType: UIKeyboardType = .default
    var placeholder: String
    var validatorType : ValidatorType
    var isconfirmPassword: Bool = false
    var background: Color = .white
    @State var height: CGFloat = Dimensions.d56
    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                if showErrorBorder {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(height: height)
                        .background(background)
                        .cornerRadius(Dimensions.d8)
                        .overlay(RoundedRectangle(cornerRadius: Dimensions.d8)
                                .stroke(.red, lineWidth:  Dimensions.d1)
                        )
                        .onChange(of: text) { oldValue, newValue in
                            validated = showBoarder ? !newValue.isEmpty : false
                        }
                }else{
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(height: height)
                        .background(background)
                        .cornerRadius(Dimensions.d8)
                        .overlay(
                            RoundedRectangle(cornerRadius: Dimensions.d8)
                                .stroke(validate() ? (removeFocus ? .clear : (isSecured ? .clear :DesignSystem.Colors.main.color)) : .red, lineWidth: validated ? Dimensions.d1 : Dimensions.d0)
                        )
                        .onChange(of: text) { oldValue, newValue in
                            showErrorBorder = false
                            validated = showBoarder ? !newValue.isEmpty : false
                        }
                }
               
                VStack(alignment: .leading) {
                    if isSecured {
                        VStack(alignment: .leading, spacing: Dimensions.d1){
                            if !text.isEmpty {
                                Text(placeholder.localized)
                                    .font(.custom(AppFont.light.name, size: Dimensions.d14))
                            }
                            SecureField(placeholder.localized, text: $text)
                                .font(.custom(AppFont.light.name, size: Dimensions.d14))
                                .frame(height: Dimensions.d20)
                        }
                        .padding(.vertical, Dimensions.d8)
                        .padding(.horizontal, Dimensions.d10)
                    } else {
                        HStack {
                            VStack(alignment: .leading , spacing: Dimensions.d1){
                                if !text.isEmpty {
                                    Text(placeholder.localized)
                                        .font(.custom(AppFont.light.name, size: Dimensions.d14))
                                        .foregroundColor(DesignSystem.Colors.title.color)
                                }
                                TextField(placeholder.localized, text: $text, onEditingChanged: { (editingChanged) in
                                    if editingChanged {
                                        removeFocus = false
                                    } else {
                                        removeFocus = true
                                    }
                                }
                                )
                                .font(.custom(AppFont.bold.name, size: Dimensions.d14))
                                .frame(height: Dimensions.d20)
                               
                            }
                            .padding(.vertical, Dimensions.d8)
                            .padding(.horizontal, Dimensions.d10)
                            .keyboardType(keywordType)
                            .keyboardType((validatorType == .mobileNumber) ? .asciiCapableNumberPad : .default)
                           
                        }
                        .background(background)
                    }
                }
                .background(background)
                .frame(maxWidth: .infinity)
                .padding(.all, Dimensions.d5)
                if validatorType == .password || isconfirmPassword  {
                    Button(action: {
                        isSecured.toggle()
                    }) {
                        Image(systemName: isSecured ? "eye" : "eye.slash")
                    }
                    .foregroundColor(DesignSystem.Colors.main.color)
                    .offset(x: Dimensions.d150)
                }
            }
            if !validate() && !validatedError.isEmpty && validated {
                Text(validatedError)
                    .font(.custom(AppFont.light.name, size: Dimensions.d12))
                    .foregroundColor(.red)
            }
        }
    }
    // MARK: - check validate input data
    func validate() -> Bool {
        let validator = ValidatorResolver.validate( for: validatorType)
        do {
            try validator.validate(text)
        }
        catch let error as ValidationError {
            DispatchQueue.main.async { validatedError =  error.message}
            return false
        }catch  {
            return false
        }
        return true
    }
}
