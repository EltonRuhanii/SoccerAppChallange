//
//  NameGeneratorHelper.swift
//  SoccerAppChallange
//
//  Created by WIZZARD on 31.5.23.
//

import Foundation


/// This function is going to generate a random name for each team usign all alphabet characters
class NameGeneratorHelper {
    class func generateRandomTeamName() -> String {
        let characters = "abcdefghijklmnopqrstuvwxyz"
        let teamNameLength = Int.random(in: 3...5)
        var teamName = "FC "
        
        let firstCharacterIndex = Int.random(in: 0..<characters.count)
        let firstCharacter = characters[characters.index(characters.startIndex, offsetBy: firstCharacterIndex)]
        teamName.append(String(firstCharacter).capitalized)
        
        for _ in 1..<teamNameLength {
            let randomIndex = Int.random(in: 0..<characters.count)
            let randomCharacter = characters[characters.index(characters.startIndex, offsetBy: randomIndex)]
            teamName.append(randomCharacter)
        }
        return teamName
    }
}
