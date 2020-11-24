//
//  User+CoreDataClass.swift
//  challenge-mobile
//
//  Created by Edno Fedulo on 24/11/20.
//  Copyright © 2020 Edno Fedulo. All rights reserved.
//
//

import Foundation
import CoreData


public class User: NSManagedObject, Codable {

    enum CodingKeys: CodingKey {
      case avatar_url, username, fullname, city, state_abbr, orders, token, email
    }

    required convenience public init(from decoder: Decoder) throws {
        guard let context = decoder.userInfo[CodingUserInfoKey.managedObjectContext] as? NSManagedObjectContext else {
          fatalError("Missing managed object context")
        }
        
        self.init(context: context)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.avatar_url = try container.decode(String.self, forKey: .avatar_url)
        self.username = try container.decode(String.self, forKey: .username)
        self.fullname = try container.decode(String.self, forKey: .fullname)
        self.city = try container.decode(String.self, forKey: .city)
        self.state_abbr = try container.decode(String.self, forKey: .state_abbr)
        self.token = try container.decode(String.self, forKey: .token)
        self.email = try container.decode(String.self, forKey: .email)
        self.orders = try container.decode(Set<Order>.self, forKey: .orders) as NSSet
    }
    
    public func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(avatar_url, forKey: .avatar_url)
        try container.encode(username, forKey: .username)
        try container.encode(fullname, forKey: .fullname)
        try container.encode(city, forKey: .city)
        try container.encode(state_abbr, forKey: .state_abbr)
        try container.encode(orders as? Set<Order>, forKey: .orders)
    }
}
