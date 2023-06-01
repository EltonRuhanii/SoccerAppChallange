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
        // Generate random RGB values between 0 and 255
        let red = Int.random(in: 0...255)
        let green = Int.random(in: 0...255)
        let blue = Int.random(in: 0...255)
        
        // Convert RGB values to a hex color string
        let hexColor = String(format: "#%02X%02X%02X", red, green, blue)
        
        return hexColor
    }
}
