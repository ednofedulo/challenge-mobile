//
//  Signature+CoreDataClass.swift
//  challenge-mobile
//
//  Created by Edno Fedulo on 24/11/20.
//  Copyright © 2020 Edno Fedulo. All rights reserved.
//
//

import Foundation
import CoreData


public class Signature: NSManagedObject, Codable {

    enum CodingKeys: CodingKey {
      case additional_franchise, months, plan_type
    }

    required convenience public init(from decoder: Decoder) throws {
        
        guard let context = decoder.userInfo[CodingUserInfoKey.managedObjectContext] as? NSManagedObjectContext else {
          fatalError("Missing managed object context")
        }
        
        self.init(context: context)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.additional_franchise = try container.decode(String.self, forKey: .additional_franchise)
        self.months = try container.decode(Int16.self, forKey: .months)
        self.plan_type = try container.decode(Int16.self, forKey: .plan_type)
    }
    
    public func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(additional_franchise, forKey: .additional_franchise)
        try container.encode(months, forKey: .months)
        try container.encode(plan_type, forKey: .plan_type)
    }
}
