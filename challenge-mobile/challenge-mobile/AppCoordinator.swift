//
//  AppCoordinator.swift
//  challenge-mobile
//
//  Created by Edno Fedulo on 24/11/20.
//  Copyright © 2020 Edno Fedulo. All rights reserved.
//

import Foundation
import UIKit

protocol CoordinatorProtocol {
    var window: UIWindow { get }
    var navigationController:UINavigationController? { get }
    func start()
}

class AppCoordinator: CoordinatorProtocol {
    
    var window: UIWindow
    var navigationController: UINavigationController?
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        
        guard UserDefaults.standard.string(forKey: "token") == nil else {
            goToHome()
            return
        }
        
        let viewModel = LoginViewModel()
        viewModel.coordinator = self
        let viewController = LoginViewController(viewModel: viewModel)
        viewModel.viewDelegate = viewController
        navigationController = nil
        window.rootViewController = viewController
    }
    
    func goToHome(){
        let homeViewModel = HomeViewModel()
        homeViewModel.coordinator = self
        let viewController = HomeTableViewController(viewModel: homeViewModel)
        homeViewModel.viewDelegate = viewController
        self.navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
    }
    
    func goToOrdersList(orders:[Order]){
        let viewModel = OrdersViewModel(orders: orders)
        viewModel.coordinator = self
        let viewController = OrdersTableViewController(viewModel: viewModel)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func goToOrderDetail(order:Order) {
        
    }

}
