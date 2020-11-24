//
//  Status+CoreDataClass.swift
//  challenge-mobile
//
//  Created by Edno Fedulo on 24/11/20.
//  Copyright © 2020 Edno Fedulo. All rights reserved.
//
//

import Foundation
import CoreData


public class Status: NSManagedObject, Codable {
    
    enum CodingKeys: CodingKey {
      case checked, code, label
    }

    required convenience public init(from decoder: Decoder) throws {
        guard let context = decoder.userInfo[CodingUserInfoKey.managedObjectContext] as? NSManagedObjectContext else {
          fatalError("Missing managed object context")
        }
        
        self.init(context: context)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.checked = try container.decode(Bool.self, forKey: .checked)
        self.code = try container.decode(String.self, forKey: .code)
        self.label = try container.decode(String.self, forKey: .label)
    }
    
    public func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(checked, forKey: .checked)
        try container.encode(code, forKey: .code)
        try container.encode(label, forKey: .label)
        
    }

}
