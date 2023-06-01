//
//  ColorGeneratorHelper.swift
//  SoccerAppChallange
//
//  Created by WIZZARD on 1.6.23.
//

import Foundation

// This function will generate a random Hex Color, which will be used to change color of team logo's, on random order.
class ColorGeneratorHelper {
    class func generateRandomHexColor() -> String {
        let red = Int.random(in: 0...255)
        let green = Int.random(in: 0...255)
        let blue = Int.random(in: 0...255)
        
        let hexColor = String(format: "#%02X%02X%02X", red, green, blue)
        
        return hexColor
    }
}
