//
//  LoginViewModel.swift
//  challenge-mobile
//
//  Created by Edno Fedulo on 24/11/20.
//  Copyright © 2020 Edno Fedulo. All rights reserved.
//

import Foundation

protocol LoginViewModelViewDelegate:AnyObject {
    func didLoginSuccess()
    func didLoginError()
}

class LoginViewModel {
    weak var coordinator: AppCoordinator?
    weak var viewDelegate:LoginViewModelViewDelegate?
}
