//
//  Vehicle+CoreDataProperties.swift
//  challenge-mobile
//
//  Created by Edno Fedulo on 24/11/20.
//  Copyright © 2020 Edno Fedulo. All rights reserved.
//
//

import Foundation
import CoreData


extension Vehicle {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Vehicle> {
        return NSFetchRequest<Vehicle>(entityName: "Vehicle")
    }

    @NSManaged public var delivery_delay: Int16
    @NSManaged public var doors_qtd: Int16
    @NSManaged public var engine: String?
    @NSManaged public var engine_type: String?
    @NSManaged public var fuel_type: String?
    @NSManaged public var image_url: [String]?
    @NSManaged public var km: Int16
    @NSManaged public var vehicle_brand: String?
    @NSManaged public var vehicle_model: String?
    @NSManaged public var vehicle_year: Int16

}
