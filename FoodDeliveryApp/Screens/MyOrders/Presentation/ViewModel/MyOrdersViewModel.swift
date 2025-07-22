//
//  MyOrderViewModel.swift
//  Created by Asset's Macbook Pro on 01/07/2025.
//  Copyright © 2025 youssef. All rights reserved.

import Foundation
import Combine

class MyOrdersViewModel: BaseViewModel, ObservableObject {
    @Published var selectedStatus: orderStatus = .all
    @Published var orders: [OrderData] = []
    @Published var searchKey: String = ""
    @Published var showStatusFilter: Bool = false
    private var getOrdersUseCase: GetOrdersUseCaseProtocol
    
    @Published var filteredOrders: [OrderData] = []
    
    init( getOrdersUseCase: GetOrdersUseCaseProtocol = GetOrdersUseCase()) {
        self.getOrdersUseCase = getOrdersUseCase
    }
    
    func filterOrders() {
        Publishers.CombineLatest(
            $searchKey.debounce(for: .seconds(0.3), scheduler: RunLoop.main),
            $selectedStatus
        )
        .map { [weak self] (searchText, status) -> [OrderData] in
            guard let self = self else { return [] }
            
            return self.orders.filter { order in
                let matchesSearch = searchText.isEmpty ||
                order.restaurant.lowercased().contains(searchText.lowercased())
                
                let matchesStatus = status == .all || order.status == status
                
                return matchesSearch && matchesStatus
            }
        }
        .assign(to: \.filteredOrders, on: self)
        .store(in: &cancellables)
        
    }
    
    // MARK: - get Orders
    func getOrders() {
        filterOrders()
        self.state = .loading()
        Task { @MainActor [weak self] in
            guard let self else { return }
            do {
                let orders = try await getOrdersUseCase.getOrders()
                self.orders = orders
                self.filteredOrders = orders
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
