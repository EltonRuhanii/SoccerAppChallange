//
//  Team.swift
//  SoccerAppChallange
//
//  Created by WIZZARD on 31.5.23.
//

import Foundation

class Team {
    let name: String
    var points: Int
    var goalScored: Int
    var goalConceded: Int
    let logo: String
    
    init(name: String,
         points: Int = 0,
         goalScored: Int = 0,
         goalConceded: Int = 0,
         logo: String)
    {
        self.name = name
        self.points = points
        self.goalScored = goalScored
        self.goalConceded = goalConceded
        self.logo = logo
    }
}

extension Team: Hashable {
    var goalDifference: Int {
        goalScored - goalConceded
    }
    
    static func == (lhs: Team, rhs: Team) -> Bool {
        return lhs.name == rhs.name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}
