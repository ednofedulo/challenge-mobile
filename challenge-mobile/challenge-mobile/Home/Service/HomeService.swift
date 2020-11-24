//
//  HomeService.swift
//  challenge-mobile
//
//  Created by Edno Fedulo on 24/11/20.
//  Copyright © 2020 Edno Fedulo. All rights reserved.
//

import Foundation

protocol HomeServiceProtocol:AnyObject {
    func fetchData()
}

class HomeService:HomeServiceProtocol {
    func fetchData() {
        guard let token = UserDefaults.standard.string(forKey: "token") else { return }
        
        
    }
}
