//
//  UIView.swift
//  challenge-mobile
//
//  Created by Edno Fedulo on 25/11/20.
//  Copyright © 2020 Edno Fedulo. All rights reserved.
//

import UIKit

class DetailsView: UIView {

    @IBOutlet weak var yearBrandLabel: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var startsFromLabel: UILabel!
    @IBOutlet weak var fuelLabel: UILabel!
    @IBOutlet weak var doorsLabel: UILabel!
    @IBOutlet weak var engineTypeLabel: UILabel!
    @IBOutlet weak var engineLabel: UILabel!
    @IBOutlet weak var deliveryDelayLabel: UILabel!
    @IBOutlet weak var kmLabel: UILabel!
    @IBOutlet weak var monthsLabel: UILabel!
    @IBOutlet weak var planTypeLabel: UILabel!
    @IBOutlet weak var monthlyPriceLabel: UILabel!
    @IBOutlet weak var extrasLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var additionalFranchiseLabel: UILabel!
    
    func setup(orderDetails:OrderDetailsModel){
        
        guard let vehicleDetails = orderDetails.vehicle_details else { return }
        guard let signatureDetails = orderDetails.signature_details else { return }
        guard let summaryValues = orderDetails.summary_values else { return }
        
        yearBrandLabel.text = "\(vehicleDetails.vehicle_year!) \(vehicleDetails.vehicle_brand!)"
        modelLabel.text = vehicleDetails.vehicle_model
        startsFromLabel.text = "R$\(summaryValues.monthly_price!)"
        engineTypeLabel.text = vehicleDetails.engine_type
        engineLabel.text = vehicleDetails.engine
        doorsLabel.text = "\(vehicleDetails.doors_qtd!) Portas"
        fuelLabel.text = vehicleDetails.fuel_type
        
        deliveryDelayLabel.text = "✔️ Entrega em até \(vehicleDetails.delivery_delay!) dias úteis"
        kmLabel.text = "Carro \(vehicleDetails.km!) Km"
        
        additionalFranchiseLabel.text = "R$\(signatureDetails.additional_franchise!)"
        planTypeLabel.text = "\(signatureDetails.plan_type!)"
        monthsLabel.text = "\(signatureDetails.months!)"
        
        monthlyPriceLabel.text = "R$\(summaryValues.monthly_price!)"
        extrasLabel.text = "R$\(summaryValues.extras!)"
        totalPriceLabel.text = "R$\(summaryValues.total_price!)"
    }
    
}
