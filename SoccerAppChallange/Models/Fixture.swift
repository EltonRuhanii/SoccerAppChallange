//
//  Fixture.swift
//  SoccerAppChallange
//
//  Created by WIZZARD on 31.5.23.
//

import Foundation

class Fixture {
    let homeTeam: Team
    let awayTeam: Team
    var homeGoals: Int = 0
    var awayGoals: Int = 0
    var winner: Team?
    var isDraw: Bool
    
    init(homeTeam: Team, awayTeam: Team, homeGoals: Int = 0, awayGoals: Int = 0, winner: Team? = nil) {
        self.homeTeam = homeTeam
        self.awayTeam = awayTeam
        self.homeGoals = homeGoals
        self.awayGoals = awayGoals
        self.winner = winner
        
        isDraw = homeGoals == awayGoals
    }
}

extension Fixture {
    var isHomeTeamWinner: Bool {
        homeTeam == winner
    }
}
