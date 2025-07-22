//  Created by Asset's Macbook Pro on 01/07/2025.
//  Copyright © 2025 youssef. All rights reserved.


import Foundation
struct OrderData : Codable, Equatable, Hashable, Identifiable {
	let id : Int
    var restaurant : String
    var customerName : String
	var restaurantImage : String
	var status : orderStatus
}


enum orderStatus: String, Codable, Hashable, CaseIterable {
    case completed =  "Completed"
    case processing = "Processing"
    case preparing = "Preparing"
    case delivery = "Delivery"
    case cancel = "Cancel"
    case all = "All"
}
