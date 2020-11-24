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
        let viewModel = LoginViewModel()
        viewModel.coordinator = self
        let viewController = LoginViewController(viewModel: viewModel)
        viewModel.viewDelegate = viewController
        window.rootViewController = viewController
        //navigationController.pushViewController(viewController, animated: true)
    }
    
//    func showDetail(for character: MarvelCharacter) {
//        let detailViewModel = DetailViewModel(character: character)
//        let viewController = DetailViewController(viewModel: detailViewModel)
//        detailViewModel.viewDelegate = viewController
//        navigationController.pushViewController(viewController, animated: true)
//    }
}
