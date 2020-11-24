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
    func doLogin(email:String, password:String, completionHandler: @escaping(_ data: User?, _ error: String?) -> Void)
}


class LoginService:LoginServiceProtocol {
    func doLogin(email: String, password: String, completionHandler: @escaping (User?, String?) -> Void) {
        let url = "https://challenge-mobile-api.liveonsolutions.com/api/v1/auth"
        
        let decoder = JSONDecoder()
        
        decoder.userInfo[CodingUserInfoKey.managedObjectContext] = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let parameters = ["email": email, "password": password]
        
        AF.request(url, method: .post, parameters: parameters).responseDecodable(of: User.self, decoder: decoder) { response in
            switch response.result {
            case let.success(user):
                completionHandler(user, nil)
            case .failure(_):
                completionHandler(nil, "Erro ao efetuar login")
            }
        }
        
    }
}
