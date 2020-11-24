//
//  Order+CoreDataProperties.swift
//  challenge-mobile
//
//  Created by Edno Fedulo on 24/11/20.
//  Copyright © 2020 Edno Fedulo. All rights reserved.
//
//

import Foundation
import CoreData


extension Order {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Order> {
        return NSFetchRequest<Order>(entityName: "Order")
    }

    @NSManaged public var order_id: Int16
    @NSManaged public var submodel_name: String?
    @NSManaged public var signature_details: Signature?
    @NSManaged public var statuses: NSSet?
    @NSManaged public var summary_values: Summary?
    @NSManaged public var vehicle_details: Vehicle?

}

// MARK: Generated accessors for statuses
extension Order {

    @objc(addStatusesObject:)
    @NSManaged public func addToStatuses(_ value: Status)

    @objc(removeStatusesObject:)
    @NSManaged public func removeFromStatuses(_ value: Status)

    @objc(addStatuses:)
    @NSManaged public func addToStatuses(_ values: NSSet)

    @objc(removeStatuses:)
    @NSManaged public func removeFromStatuses(_ values: NSSet)

}
