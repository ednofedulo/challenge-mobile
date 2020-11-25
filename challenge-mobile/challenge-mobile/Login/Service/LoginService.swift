//
//  LoginService.swift
//  challenge-mobile
//
//  Created by Edno Fedulo on 24/11/20.
//  Copyright © 2020 Edno Fedulo. All rights reserved.
//

import Foundation
import Alamofire

protocol LoginServiceProtocol:AnyObject {
    func doLogin(email:String, password:String, completionHandler: @escaping(_ token: String?, _ error: String?) -> Void)
}

class LoginService:LoginServiceProtocol {
    func doLogin(email: String, password: String, completionHandler: @escaping (String?, String?) -> Void) {
        let url = "https://challenge-mobile-api.liveonsolutions.com/api/v1/auth"
        
        let parameters = ["email": email, "password": password]
        
        AF.request(url, method: .post, parameters: parameters).responseDecodable(of: LoginModel.self) { response in
            switch response.result {
            case let .success(loginModel):
                guard let token = loginModel.token else {
                    completionHandler(nil, "Erro ao efetuar login")
                    return
                }
                
                completionHandler(token, nil)
            case .failure(_):
                completionHandler(nil, "Erro ao efetuar login")
            }
        }
    }
}
