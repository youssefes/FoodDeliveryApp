//
//  Endpoint.swift
//  Created by Asset's Macbook Pro on 01/07/2025.
//  Copyright © 2025 youssef. All rights reserved.

// MARK: - HTTP Method
import Foundation

enum HTTPMethod: String {
    case GET, POST, PUT, DELETE
}

// MARK: - Endpoint

struct Endpoint {
    let path: String
    let method: HTTPMethod
    let headers: [String: String]
    let queryItems: [URLQueryItem]
    let body: Encodable?

    init(path: String,
         method: HTTPMethod = .GET,
         headers: [String: String] = [:],
         queryItems: [URLQueryItem] = [],
         body: Encodable? = nil) {
        self.path = path
        self.method = method
        self.headers = headers
        self.queryItems = queryItems
        self.body = body
    }
}
