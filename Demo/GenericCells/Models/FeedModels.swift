//
//  FeedModels.swift
//  GenericCellControllersExample
//
//  Created by Javier Valdera on 28/09/2017.
//  Copyright © 2017 Busuu Ltd. All rights reserved.
//

import Foundation

struct Picture : Codable {
    let author: String
    let imageName: String
    let desc: String
    let weight: String
    let price: String
    var quantity: String
}
