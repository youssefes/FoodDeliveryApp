//
//  Untitled.swift
//  FoodDeliveryApp
//
//  Created by Asset's Macbook Pro on 02/07/2025.
//
import Combine
import Foundation

typealias WebSocketContract = (
    WebSocketHandlerProtocol & WebSocketWrapperProtocol
)
protocol WebSocketHandlerProtocol {
    func connect(with request: URLRequest) async
    func disconnect()
    func send(_ message: String) async
    func receiveMessages() async
}

protocol WebSocketWrapperProtocol  {
    var onConnected: PassthroughSubject<Void, Never> { get }
    var onReceiveMessage: PassthroughSubject<Data, Never> { get }
    var onDisconnected: PassthroughSubject<Void, Never> { get }
}
