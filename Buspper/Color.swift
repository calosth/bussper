//
//  color.swift
//  Buspper
//
//  Created by Carlos Linares on 2/23/16.
//  Copyright © 2016 Carlos Linares. All rights reserved.
//

import UIKit

extension UIColor {
    
    static func hexToUIColor (hex: String, alpha: CGFloat = 1) -> UIColor {
        var rgbValue: UInt32 = 0
        let scanner = NSScanner(string: hex)
        scanner.scanLocation = 1
        scanner.scanHexInt(&rgbValue)
        let red = (CGFloat((rgbValue & 0xFF0000) >> 16)) / 255.0
        let green = (CGFloat((rgbValue & 0xFF00) >> 8)) / 255.0
        let blue = CGFloat((rgbValue & 0xFF)) / 255.0
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    static func blueBuspper() -> UIColor {
        let coolBlue: UIColor = hexToUIColor("#69D2E7")
        return coolBlue
    }
}