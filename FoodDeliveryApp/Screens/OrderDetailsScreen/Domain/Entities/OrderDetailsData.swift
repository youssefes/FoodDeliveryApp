//  Created by Asset's Macbook Pro on 01/07/2025.
//  Copyright © 2025 youssef. All rights reserved.


import Foundation
struct OrderDetailsData : Codable, Equatable, Hashable {
	let id : Int
    var restaurant : String
	var restaurantImage : String
    var subTotal: String
    var delivery: String
    var total: String
    var address: String
    var owner: Owner
	var status : orderStatus
}
 

struct Owner:  Codable, Equatable, Hashable {
    var id: Int
    var name: String
    var phone: String
}
