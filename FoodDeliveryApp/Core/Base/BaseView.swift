//
//  BaseView.swift
//  Created by Asset's Macbook Pro on 01/07/2025.
//  Copyright © 2025 youssef. All rights reserved.

import SwiftUI

public enum ViewModelState<Error>: Equatable {
    case idle
    case loading(message: String? = nil)
    case successful
    case failed(NetworkError)
}

struct BaseView<Content>: View where Content: View {
    // MARK: - PROPERTIES
    let content: Content
    @Binding private var state: ViewModelState<NetworkError>
    @State private var showErrorAlert = false
    @State private var errorMessage: String = ""
    // MARK: - INIT
    public init(
        state: Binding<ViewModelState<NetworkError>>,
        @ViewBuilder content: () -> Content
    ) {
        self._state = state
        self.content = content()
    }

    public var body: some View {
        ZStack {
            content
            if case .loading = state {
                Spacer()
                ShowProgressView()
                Spacer()
            }
        }
        .background(DesignSystem.Colors.background.color)
        .onChange(of: state) { oldState, newState  in
            if case let .failed(error) = newState {
                errorMessage = error.localizedDescription
                showErrorAlert = true
            } else {
                errorMessage = ""
                showErrorAlert = false
            }
        }
        .alert("Error", isPresented: $showErrorAlert, actions: {
            Button("OK", role: .cancel) {}
        }, message: {
            Text(errorMessage)
        })
    }
}
