//
//  FeedCoordinator.swift
//  GenericCellControllersExample
//
//  Created by Javier Valdera on 28/09/2017.
//  Copyright © 2017 Busuu Ltd. All rights reserved.
//

import Foundation

class FeedCoordinator {

    private weak var viewController: ViewController?

    init(viewController: ViewController?) {
        self.viewController = viewController
    }

    func pictureSelected(_ picture: Picture) {
        print("Cell Selected!")
    }
    
    func itemDeleted(_ picture: Picture) {
        let index = FeedDataProvider.data.firstIndex(where: {$0.author == picture.author})
        FeedDataProvider.data.remove(at: index!)
        viewController?.displayData()
    }
    
    func quantityIncreasedDecreased(_ picture: Picture, isPlus : Bool) {
        let index = FeedDataProvider.data.firstIndex(where: {$0.author == picture.author})
        let oldObj = FeedDataProvider.data[index!]
        var quantity : Int = Int(oldObj.quantity)!
        var price : Double = Double(oldObj.price.components(separatedBy: " ")[1])!
        price = price/Double(quantity)
        if isPlus {
            quantity += 1
        } else if quantity>1 {
            quantity -= 1
        } else {
            return
        }
        price = price*Double(quantity)
        
        let priceStr = "SAR " + String(format: "%.2f", price)
        let newObj = Picture(author: oldObj.author, imageName: oldObj.imageName, desc: oldObj.desc, weight: oldObj.weight, price: priceStr, quantity: "\(quantity)")
        FeedDataProvider.data[index!] = newObj
        
        self.updateCostLabel()
        self.updateFreeShippingLabel()
        viewController?.displayData()
    }
    
    func updateCostLabel() {
        var totalCount = 0.0
        var totalQuantity = 0
        for obj in FeedDataProvider.data {
            totalCount += Double(obj.price.components(separatedBy: " ")[1])!
            totalQuantity += Int(obj.quantity)!
        }
        let totalStr = "SAR " + String(format: "%.2f", totalCount)
        viewController?.costLabel.text = "\(totalQuantity) item(s) - \(totalStr)"
        self.updateProgressView(totalQuantity: totalQuantity)
    }
    
    func updateProgressView(totalQuantity : Int) {
        if totalQuantity>=10 {
            viewController?.progressView.setProgress(1.0, animated: true)
        } else {
            viewController?.progressView.setProgress(Float(Double(totalQuantity)/10.0), animated: true)
        }
    }
    
    func updateFreeShippingLabel() {
        let itemCount = FeedDataProvider.data.count
        let stringValue = "There are \(itemCount) results."
        let attributedString: NSMutableAttributedString = NSMutableAttributedString(string: stringValue)
        attributedString.setColor(color: .mainPurple, forText: "\(itemCount)")
        viewController?.freeShippingLabel.attributedText = attributedString
    }
}
