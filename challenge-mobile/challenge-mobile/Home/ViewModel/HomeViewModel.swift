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
    
    weak var viewDelegate:HomeViewModelViewDelegate?
    var service:HomeServiceProtocol = HomeService()
    
    func fetchData(){
        
    }
}
