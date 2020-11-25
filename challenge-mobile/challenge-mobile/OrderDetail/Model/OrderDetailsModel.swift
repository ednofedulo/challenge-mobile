//
//  OrderDetails.swift
//  challenge-mobile
//
//  Created by Edno Fedulo on 25/11/20.
//  Copyright © 2020 Edno Fedulo. All rights reserved.
//

import Foundation

struct OrderDetailsModel:Codable {
    let vehicle_details:VehicleDetails?
    let signature_details:SignatureDetails?
    let summary_values:SummaryValues?
}

struct VehicleDetails:Codable {
    let image_url:[String]?
    let vehicle_year:Int?
    let vehicle_brand:String?
    let vehicle_model:String?
    let engine:String?
    let engine_type:String?
    let fuel_type:String?
    let doors_qtd:Int?
    let delivery_delay:Int?
    let km:Int?
}

struct SignatureDetails:Codable {
    let months:Int?
    let plan_type:Int?
    let additional_franchise:String?
}

struct SummaryValues:Codable {
    let monthly_price:String?
    let extras:String?
    let total_price:String?
}
