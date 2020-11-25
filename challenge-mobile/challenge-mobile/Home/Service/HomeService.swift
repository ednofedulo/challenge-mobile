//
//  HomeService.swift
//  challenge-mobile
//
//  Created by Edno Fedulo on 24/11/20.
//  Copyright © 2020 Edno Fedulo. All rights reserved.
//

import Foundation
import Alamofire

protocol HomeServiceProtocol:AnyObject {
    func fetchData(completionHandler: @escaping(_ homeModel: HomeModel?, _ error: String?) -> Void)
}

class HomeService:HomeServiceProtocol {
    func fetchData(completionHandler: @escaping (HomeModel?, String?) -> Void) {
        guard let token = UserDefaults.standard.string(forKey: "token") else { return }
        
        let url = "https://challenge-mobile-api.liveonsolutions.com/api/v1/user/profile?token=\(token)"
        
        AF.request(url).responseDecodable(of: HomeModel.self) { response in
            switch response.result {
            case let .success(homeModel):
                completionHandler(homeModel, nil)
            case .failure(_):
                completionHandler(nil, "Erro ao obter dados")
            }
        }
    }
}
