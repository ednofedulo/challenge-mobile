//
//  LoginViewController.swift
//  challenge-mobile
//
//  Created by Edno Fedulo on 24/11/20.
//  Copyright © 2020 Edno Fedulo. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    var viewModel:LoginViewModel?
    
    init(viewModel:LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemRed
    }
}

extension LoginViewController:LoginViewModelViewDelegate {
    func didLoginSuccess() {
        
    }
    
    func didLoginError() {
        
    }
}
