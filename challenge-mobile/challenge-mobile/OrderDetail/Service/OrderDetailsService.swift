//
//  OrderDetailsService.swift
//  challenge-mobile
//
//  Created by Edno Fedulo on 25/11/20.
//  Copyright © 2020 Edno Fedulo. All rights reserved.
//

import Foundation
import Alamofire

protocol OrderDetailsServiceProtocol:AnyObject {
    func fetchData(order_id:Int, completionHandler: @escaping(_ homeModel: OrderDetailsModel?, _ error: String?) -> Void)
}

class OrderDetailsService:OrderDetailsServiceProtocol {
    func fetchData(order_id:Int, completionHandler: @escaping (OrderDetailsModel?, String?) -> Void) {
        
        guard let token = UserDefaults.standard.string(forKey: "token") else { return }
        
        let url = "https://challenge-mobile-api.liveonsolutions.com/api/v1/user/profile/order_details?token=\(token)&order_id=\(order_id)"
        
        AF.request(url).responseDecodable(of: OrderDetailsModel.self) { response in
            switch response.result {
            case let .success(value):
                completionHandler(value, nil)
            case .failure(_):
                completionHandler(nil, "Erro ao obter dados")
            }
        }
    }
}
