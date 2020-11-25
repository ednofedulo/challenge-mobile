//
//  HomeViewModel.swift
//  challenge-mobile
//
//  Created by Edno Fedulo on 24/11/20.
//  Copyright © 2020 Edno Fedulo. All rights reserved.
//

import Foundation

protocol HomeViewModelViewDelegate:AnyObject {
    func didFetchDataFromAPISuccess(sender: HomeViewModel)
    func didFetchDataFromAPIError(sender: HomeViewModel)
}

class HomeViewModel {
    
    var viewDelegate:HomeViewModelViewDelegate?
    lazy var service:HomeServiceProtocol = HomeService()
    var model:HomeModel?
    
    func fetchData(){
        
        service.fetchData { (homeModel, error) in
            guard error == nil else {
                self.viewDelegate?.didFetchDataFromAPIError(sender: self)
                return
            }
            
            self.model = homeModel
            self.viewDelegate?.didFetchDataFromAPISuccess(sender: self)
        }
        
    }
}
