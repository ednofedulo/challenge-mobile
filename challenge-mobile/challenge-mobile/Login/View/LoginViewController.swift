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
    
    @IBOutlet weak var txtEmail:UITextField?
    @IBOutlet weak var txtPassword:UITextField?
    
    init(viewModel:LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTapOnBtnLogin(_ sender: Any) {
        
        guard let email = txtEmail?.text, let password = txtPassword?.text else {
            return
        }
        
        self.viewModel?.doLogin(email: email, password: password)
    }
    
}

extension LoginViewController:LoginViewModelViewDelegate {
    
    func showLoginError(msg:String) {
        self.showAlertMessage(title: "Atenção", msg: msg)
    }
}
