//
//  Order+CoreDataClass.swift
//  challenge-mobile
//
//  Created by Edno Fedulo on 24/11/20.
//  Copyright © 2020 Edno Fedulo. All rights reserved.
//
//

import Foundation
import CoreData


public class Order: NSManagedObject, Codable {

    enum CodingKeys: CodingKey {
      case order_id, submodel_name, signature_details, statuses, summary_values, vehicle_details
    }

    required convenience public init(from decoder: Decoder) throws {
        guard let context = decoder.userInfo[CodingUserInfoKey.managedObjectContext] as? NSManagedObjectContext else {
          fatalError("Missing managed object context")
        }
        
        self.init(context: context)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.order_id = try container.decode(Int16.self, forKey: .order_id)
        self.submodel_name = try container.decode(String.self, forKey: .submodel_name)
        self.signature_details = try container.decode(Signature.self, forKey: .signature_details) as Signature
        self.statuses = try container.decode(Set<Status>.self, forKey: .statuses) as NSSet
        self.summary_values = try container.decode(Summary.self, forKey: .summary_values)
        self.vehicle_details = try container.decode(Vehicle.self, forKey: .vehicle_details)
        
    }
    
    public func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(order_id, forKey: .order_id)
        try container.encode(submodel_name, forKey: .submodel_name)
        try container.encode(signature_details, forKey: .signature_details)
        try container.encode(summary_values, forKey:  .summary_values)
        try container.encode(vehicle_details, forKey:  .vehicle_details)
        try container.encode(statuses as! Set<Status>, forKey: .statuses)
    }
}
