//
//  HomeModel.swift
//  challenge-mobile
//
//  Created by Edno Fedulo on 24/11/20.
//  Copyright © 2020 Edno Fedulo. All rights reserved.
//

import Foundation

struct HomeModel:Codable {
    let avatar_url:String?
    let username:String?
    let fullname:String?
    let city:String?
    let state_abbr:String?
    let orders:[Order]?
}
