//
//  OrdersViewModel.swift
//  challenge-mobile
//
//  Created by Edno Fedulo on 25/11/20.
//  Copyright © 2020 Edno Fedulo. All rights reserved.
//

import Foundation


class OrdersViewModel {
    
    weak var coordinator:AppCoordinator?
    
    var orders:[Order]?
    let screenTitle = "MINHAS ASSINATURAS"
    init(orders:[Order]) {
        self.orders = orders
    }
    
    func getOrder(at index:Int) -> Order? {
        guard let orders = self.orders else { return nil }
        let order = orders[index]
        return order
    }
    
    func didSelectOrder(at index:Int){
        guard let order = getOrder(at: index) else { return }
        
        coordinator?.goToOrderDetail(order_id: order.order_id!)
    }
}
