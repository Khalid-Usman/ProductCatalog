//
//  FeedDataProvider.swift
//  GenericCellControllersExample
//
//  Created by Javier Valdera on 28/09/2017.
//  Copyright © 2017 Busuu Ltd. All rights reserved.
//

import Foundation

struct FeedDataProvider {
    /*
    static let harcodedData: [FeedElement] = [
        .picture(Picture(id: 1, author: "Mancera Roses Vanille", imageName: "https://s3-eu-west-1.amazonaws.com/niceonesa-prd-s3-files/image/img/p/2/7/1/9/2719-large_default.jpg", desc: "mancera", weight: "Eau de Parfum - 120ml", price: "SAR 458.85", quantity: "1")),
        .picture(Picture(id: 2, author: "Topface Matte Paint Rouge", imageName: "https://s3-eu-west-1.amazonaws.com/niceonesa-prd-s3-files/image/catalog/product/18695879_Topface%20Matte%20Paint%20Rouge%20-%20108-500x500.png", desc: "Topface", weight: "Topface - 108ml", price: "SAR 54.76", quantity: "1")),
        ]
    */
    static var data : [Picture] = [
        Picture(author: "Mancera Roses Vanille", imageName: "https://s3-eu-west-1.amazonaws.com/niceonesa-prd-s3-files/image/img/p/2/7/1/9/2719-large_default.jpg", desc: "mancera", weight: "Eau de Parfum - 120ml", price: "SAR 458.85", quantity: "1"),
        Picture(author: "Topface Matte Paint Rouge", imageName: "https://s3-eu-west-1.amazonaws.com/niceonesa-prd-s3-files/image/catalog/product/18695879_Topface%20Matte%20Paint%20Rouge%20-%20108-500x500.png", desc: "Topface", weight: "Topface - 108ml", price: "SAR 54.76", quantity: "1")
    ]

}
