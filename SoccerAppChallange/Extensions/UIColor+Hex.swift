//
//  UIColor+Hex.swift
//  SoccerAppChallange
//
//  Created by WIZZARD on 1.6.23.
//

import UIKit

extension UIColor {
    class func colorFromHexString(_ hexCode:String!) -> UIColor {
        let scanner = Scanner(string:hexCode)
        scanner.charactersToBeSkipped = CharacterSet(charactersIn: "$+#")
        var hex: CUnsignedLongLong = 0
        if(!scanner.scanHexInt64(&hex)) { return UIColor() }
        let r = (hex >> 16) & 0xFF;
        let g = (hex >> 8) & 0xFF;
        let b = (hex) & 0xFF;
        return UIColor.init(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: 1)
    }
}
