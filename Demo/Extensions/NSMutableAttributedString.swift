//
//  NSMutableAttributedString.swift
//  Demo
//
//  Created by mac on 17/07/2021.
//

import Foundation
import UIKit

extension NSMutableAttributedString {

    func setColor(color: UIColor, forText stringValue: String) {
       let range: NSRange = self.mutableString.range(of: stringValue, options: .caseInsensitive)
        self.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
    }
}

extension UIColor {
    
    static var mainPurple = UIColor.rgb(red: 240, green: 0, blue: 240)
    
    static var mainGray = UIColor.rgb(red: 240, green: 240, blue: 240)
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}
