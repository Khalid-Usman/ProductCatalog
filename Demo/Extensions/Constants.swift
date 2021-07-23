//
//  Constants.swift
//  Demo
//
//  Created by mac on 18/07/2021.
//

import Foundation

enum Fonts: String {
    
    case Bold = "Verdana-Bold"
    case Regular = "Verdana"
    
    static func get(type: Fonts) -> String {
        return type.rawValue
    }
}
