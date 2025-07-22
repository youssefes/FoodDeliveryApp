//
//  GetOrdersLocal.swift
//  Created by Asset's Macbook Pro on 01/07/2025.
//  Copyright © 2025 youssef. All rights reserved.

import Foundation
import CoreData

protocol GetOrdersLocalProtocol {
    func save(orders: [OrderData]) throws
    func loadOrders() throws -> [OrderData]
    func updateOrder(order: OrderData) throws
}

final class GetOrdersLocal: GetOrdersLocalProtocol {
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "OrderModel")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Core Data failed: \(error)")
            }
        }
    }

    var context: NSManagedObjectContext {
        container.viewContext
    }
    
    func save(orders: [OrderData]) throws {
        // Add new data
        for order in orders {
            let request: NSFetchRequest<OrderModel> = OrderModel.fetchRequest()
            request.predicate = NSPredicate(format: "id == %d", order.id)
            request.fetchLimit = 1
            if (try context.fetch(request).first) == nil {
                let entity = OrderModel(context: context)
                entity.id = Int64(order.id)
                entity.restaurant = order.restaurant
                entity.restaurantImage = order.restaurantImage
                entity.customerName = order.customerName
                entity.status = order.status.rawValue
            }
        }

        try context.save()
    }

    func loadOrders() throws -> [OrderData] {
        let request: NSFetchRequest<OrderModel> = OrderModel.fetchRequest()
        let result = try context.fetch(request)
        
        return result.map {
            return OrderData(id: Int($0.id), restaurant: $0.restaurant ?? "", customerName: $0.customerName ?? "", restaurantImage: $0.restaurantImage ?? "" , status: orderStatus(rawValue: $0.status ?? "") ?? .all)
        }
    }

    func updateOrder(order: OrderData) throws {
        let request: NSFetchRequest<OrderModel> = OrderModel.fetchRequest()
        request.predicate = NSPredicate(format: "id == %d", order.id)
        request.fetchLimit = 1

        if let entity = try context.fetch(request).first {
            // 🔁 Update the fields
            entity.restaurant = order.restaurant
            entity.restaurantImage = order.restaurantImage
            entity.status = order.status.rawValue
            entity.customerName = order.customerName
            try context.save()
            print("✅ order \(order.id) updated in Core Data.")
        } else {
            print("⚠️ No matching order found for id: \(order.id)")
        }
    }
}
