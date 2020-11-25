//
//  OrderDetailViewModel.swift
//  challenge-mobile
//
//  Created by Edno Fedulo on 25/11/20.
//  Copyright © 2020 Edno Fedulo. All rights reserved.
//

import Foundation

protocol OrderDetailViewModelViewDelegate:AnyObject {
    func didFetchDataFromAPISuccess(sender: OrderDetailViewModel)
    func didFetchDataFromAPIError(sender: OrderDetailViewModel)
}

class OrderDetailViewModel {
    
    let order_id:Int?
    var model:OrderDetailsModel?
    var viewDelegate:OrderDetailViewModelViewDelegate?
    lazy var service:OrderDetailsServiceProtocol = OrderDetailsService()
    
    init(order_id:Int) {
        self.order_id = order_id
    }
    
    func fetchData(){
        service.fetchData(order_id: order_id!) { (orderDetails, error) in
            guard error == nil else {
                self.viewDelegate?.didFetchDataFromAPIError(sender: self)
                return
            }
            
            self.model = orderDetails
            
            self.viewDelegate?.didFetchDataFromAPISuccess(sender: self)
        }
    }
}
