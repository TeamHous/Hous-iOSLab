//
//  UIColor+.swift
//  HousLab_iOS
//
//  Created by 김지현 on 2022/07/05.
//

import UIKit

extension UIColor {
    
    static var hous_blue_bg: UIColor {
        return UIColor(hex: "#eff5ff")
    }
    
    static var hous_blue_bg2: UIColor {
        return UIColor(hex: "#CCE1FF")
    }
    static var hous_purple_bg: UIColor {
        return UIColor(hex: "F9F1FF")
    }
}

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexFormatted: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        
        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }
        
        assert(hexFormatted.count == 6, "Invalid hex code used.")
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)
        
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0, alpha: alpha)
    }
}
