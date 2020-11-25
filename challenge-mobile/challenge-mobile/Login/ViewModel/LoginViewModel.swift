//
//  LoginViewModel.swift
//  challenge-mobile
//
//  Created by Edno Fedulo on 24/11/20.
//  Copyright © 2020 Edno Fedulo. All rights reserved.
//

import Foundation

protocol LoginViewModelViewDelegate:AnyObject {
    func showLoginError(msg:String)
}

class LoginViewModel {
    weak var coordinator: AppCoordinator?
    var viewDelegate:LoginViewModelViewDelegate?
    lazy var service:LoginServiceProtocol = LoginService()
    
    func doLogin(email:String, password:String) {
        
        guard email.isEmpty == false, password.isEmpty == false else {
            self.viewDelegate?.showLoginError(msg: "Os campos Email e Senha são obrigatórios")
            return
        }
        
        service.doLogin(email: email, password: password) { (token, error) in
            
            guard error == nil else {
                self.viewDelegate?.showLoginError(msg: error!)
                return
            }
            
            UserDefaults.standard.set(token, forKey: "token")
            
            DispatchQueue.main.async {
                self.coordinator?.goToHome()
            }
            
        }
    }
}
