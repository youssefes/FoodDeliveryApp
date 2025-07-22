//
//  ShowOrderTrackViewModel.swift
//  Created by Asset's Macbook Pro on 01/07/2025.
//  Copyright © 2025 youssef. All rights reserved.

import Foundation
import Combine
import CoreLocation

@MainActor
class OrderDetailsViewModel: BaseViewModel, ObservableObject {
   
    @Published var orderStatus: orderStatus = .processing
    @Published var orderDetails: OrderDetailsData?
    
    private var getOrdersDetailsUseCase: GetOrdersDetailsUseCaseProtocol
    private var socketSessionHandler: WebSocketContract
    init(
        getOrdersDetailsUseCase: GetOrdersDetailsUseCaseProtocol =
         GetOrdersDetailsUseCase(),
         socketSessionHandler: WebSocketContract = SocketClient()
    ) {
        self.getOrdersDetailsUseCase = getOrdersDetailsUseCase
        self.socketSessionHandler = socketSessionHandler
    }
    
    // MARK: - get Order
    func getOrderDetails(orderId: Int) {
        lisenToOrderStatus(orderId: orderId)
        self.state = .loading()
        Task { [weak self] in
            guard let self else { return }
            do {
                let orders = try await getOrdersDetailsUseCase.getOrderDetails(orderId: orderId)
                orderDetails = orders
                orderStatus = orders.status
                lisenToOrderStatus(orderId: orderId)
                state = .successful
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
    
    func lisenToOrderStatus(orderId: Int) {
        guard let url = URL(string: APIUrls.socketConnection) else { return }
        socketSessionHandler = SocketClient()
        Task { await  socketSessionHandler.connect(with: URLRequest(url: url))}
        socketSessionHandler.onConnected.sink { [weak self] in
            print("Connected successfully")
        }
        .store(in: &cancellables)
        socketSessionHandler.onReceiveMessage
            .receive(on: RunLoop.main)
            .sink { [weak self] data in
            guard let self else { return }
            do {
                let resulte  = try JSONDecoder().decode(OrderUpdateModel.self, from: data)
                if resulte.orderId == "\(orderId)" {
                    orderStatus = resulte.status
                }
            } catch {
                print(error)
            }
        }.store(in: &cancellables)
    }

    deinit {
        socketSessionHandler.disconnect()
    }
}
