//
//  Order.swift
//  challenge-mobile
//
//  Created by Edno Fedulo on 24/11/20.
//  Copyright © 2020 Edno Fedulo. All rights reserved.
//

import Foundation

struct Order:Codable {
    let order_id:Int?
    let submodel_name:String?
    let statuses:[Status]?
}

struct Status:Codable {
    let checked:Bool?
    let code:String?
    let label:String?
}
