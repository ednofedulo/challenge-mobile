//
//  Vehicle+CoreDataClass.swift
//  challenge-mobile
//
//  Created by Edno Fedulo on 24/11/20.
//  Copyright © 2020 Edno Fedulo. All rights reserved.
//
//

import Foundation
import CoreData


public class Vehicle: NSManagedObject, Codable {
    
    enum CodingKeys: CodingKey {
        case delivery_delay, doors_qtd, engine, engine_type, fuel_type, image_url, km, vehicle_brand, vehicle_model, vehicle_year
    }

    required convenience public init(from decoder: Decoder) throws {
        guard let context = decoder.userInfo[CodingUserInfoKey.managedObjectContext] as? NSManagedObjectContext else {
          fatalError("Missing managed object context")
        }
        
        self.init(context: context)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.delivery_delay = try container.decode(Int16.self, forKey: .delivery_delay)
        self.doors_qtd = try container.decode(Int16.self, forKey: .doors_qtd)
        self.engine = try container.decode(String.self, forKey: .engine)
        self.engine_type = try container.decode(String.self, forKey: .engine_type)
        self.fuel_type = try container.decode(String.self, forKey: .fuel_type)
        self.image_url = try container.decode([String].self, forKey: .image_url) as [String]
        self.km = try container.decode(Int16.self, forKey: .km)
        self.vehicle_brand = try container.decode(String.self, forKey: .vehicle_brand)
        self.vehicle_model = try container.decode(String.self, forKey: .vehicle_model)
        self.vehicle_year = try container.decode(Int16.self, forKey: .vehicle_year)
        
    }
    
    public func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(delivery_delay, forKey: .delivery_delay)
        try container.encode(doors_qtd, forKey: .doors_qtd)
        try container.encode(engine_type, forKey: .engine_type)
        try container.encode(engine, forKey: .engine)
        try container.encode(fuel_type, forKey: .fuel_type)
        try container.encode(image_url, forKey: .image_url)
        try container.encode(km, forKey: .km)
        try container.encode(vehicle_brand, forKey: .vehicle_brand)
        try container.encode(vehicle_model, forKey: .vehicle_model)
        try container.encode(vehicle_year, forKey: .vehicle_year)
    }

}
