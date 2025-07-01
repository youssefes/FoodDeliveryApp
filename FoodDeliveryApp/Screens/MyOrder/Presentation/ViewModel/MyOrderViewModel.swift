//
//  MyOrderViewModel.swift
//  Created by Asset's Macbook Pro on 01/07/2025.
//  Copyright © 2025 youssef. All rights reserved.

import Foundation
import Combine

@MainActor
class MyOrderViewModel: BaseViewModel, ObservableObject {
    @Published var orders: [OrderData] = []
    private var getOrdersUseCase: GetOrdersUseCaseProtocol
    
    init( getOrdersUseCase: GetOrdersUseCaseProtocol = GetOrdersUseCase()) {
        self.getOrdersUseCase = getOrdersUseCase
    }
    
// MARK: - get Orders
    func getOrders() {
        self.state = .loading()
        Task { [weak self] in
            guard let self else { return }
            do {
                let orders = try await getOrdersUseCase.GetOrders()
                self.orders = orders
                self.state = .successful
            } catch {
                print(error)
                if let networkError = error as? NetworkError {
                    state = .failed(networkError)
                } else {
                    state = .failed(NetworkError.requestFailed(error))
                }
            }
        }
    }
}
