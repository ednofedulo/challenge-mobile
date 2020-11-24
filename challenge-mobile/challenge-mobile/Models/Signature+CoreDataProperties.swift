//
//  Signature+CoreDataProperties.swift
//  challenge-mobile
//
//  Created by Edno Fedulo on 24/11/20.
//  Copyright © 2020 Edno Fedulo. All rights reserved.
//
//

import Foundation
import CoreData


extension Signature {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Signature> {
        return NSFetchRequest<Signature>(entityName: "Signature")
    }

    @NSManaged public var additional_franchise: String?
    @NSManaged public var months: Int16
    @NSManaged public var plan_type: Int16

}
