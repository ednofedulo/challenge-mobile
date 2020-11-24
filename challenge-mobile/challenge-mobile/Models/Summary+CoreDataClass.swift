//
//  Summary+CoreDataClass.swift
//  challenge-mobile
//
//  Created by Edno Fedulo on 24/11/20.
//  Copyright © 2020 Edno Fedulo. All rights reserved.
//
//

import Foundation
import CoreData


public class Summary: NSManagedObject, Codable {

    enum CodingKeys: CodingKey {
      case extras, monthly_price, total_price
    }

    required convenience public init(from decoder: Decoder) throws {
        guard let context = decoder.userInfo[CodingUserInfoKey.managedObjectContext] as? NSManagedObjectContext else {
          fatalError("Missing managed object context")
        }
        
        self.init(context: context)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.extras = try container.decode(String.self, forKey: .extras)
        self.monthly_price = try container.decode(String.self, forKey: .monthly_price)
        self.total_price = try container.decode(String.self, forKey:
            .total_price)
    }
    
    public func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(extras, forKey: .extras)
        try container.encode(monthly_price, forKey: .monthly_price)
        try container.encode(total_price, forKey: .total_price)
    }
}
