//
//  LeagueManager.swift
//  SoccerAppChallange
//
//  Created by WIZZARD on 31.5.23.
//

import Foundation

class LeagueManager {
    // MARK: PROPERTIES
    var teams: [Team] = []
    var fixtures: [Fixture] = []
    var fixturesResults: [Fixture] = []
    
    static let currentLeague = LeagueManager()
    
    private init() { }
    
    // MARK: - FUNCTIONS
    /// This function will create random name teams, and it will be used then to generate fixtures, Each team will have it's own atributes: Team Name, Points, Goal Scored, Goal Conceded and logo.
    /// - Parameter count: count will be used to set the number of teams we want to generate
    func generateTeams(count: Int) {
        teams = []
        fixtures = []
        
        for _ in 0..<count {
            let teamName = NameGeneratorHelper.generateRandomTeamName()
            let points = 0
            let goalScored = 0
            let goalConceded = 0
            let logo = ColorGeneratorHelper.generateRandomHexColor()
            
            let team = Team(name: teamName, points: points, goalScored: goalScored, goalConceded: goalConceded, logo: logo)
            teams.append(team)
        }
        teams = teams.sorted(by: {$0.name < $1.name})
    }
    
    /// This function will create random fixtures. And the same fixture is gonna generate two times but second time it will be other way around
    func createLeagueFixtures() {
        for i in 0..<teams.count {
            let homeTeam = teams[i]
            
            for j in (i + 1)..<teams.count {
                let awayTeam = teams[j]
                let fixture = Fixture(homeTeam: homeTeam, awayTeam: awayTeam)
                fixtures.append(fixture)
                
                let reverseFixture = Fixture(homeTeam: awayTeam, awayTeam: homeTeam)
                fixtures.append(reverseFixture)
            }
        }
    }
    
    /// Result generator
    /// - This function will generate a random score for each team and detrimne the winner. Also will give winner team 3 points, if its a draw will give both teams 1 points, and loser gets 0
    /// - Parameter completion: shows all game results when completed
    func generateResults(completion: @escaping ()->Void) {
        for fixture in fixtures {
            let homeGoals = Int.random(in: 0...5)
            let awayGoals = Int.random(in: 0...5)
            
            fixture.homeGoals = homeGoals
            fixture.awayGoals = awayGoals
            
            if homeGoals > awayGoals {
                fixture.winner = fixture.homeTeam
                fixture.isDraw = false
            } else if awayGoals > homeGoals {
                fixture.winner = fixture.awayTeam
                fixture.isDraw = false
            } else {
                fixture.isDraw = true
                fixture.winner = nil
            }
            
            fixture.homeTeam.goalScored += homeGoals
            fixture.homeTeam.goalConceded += awayGoals
            fixture.awayTeam.goalScored += awayGoals
            fixture.awayTeam.goalConceded += homeGoals
            
            if fixture.winner == fixture.homeTeam {
                fixture.homeTeam.points += 3 // Home team wins
            } else if fixture.winner == fixture.awayTeam {
                fixture.awayTeam.points += 3 // Away team wins
            } else {
                fixture.homeTeam.points += 1 // Draw
                fixture.awayTeam.points += 1 // Draw
            }
        }
        completion()
    }
    
    /// Will enable us to sort the team table by points at the end
    /// - Parameter completion: Will reload data on main screen, leagu table will be sorted by points.
    func sortLeagueTable(completion: @escaping ()->Void) {
        teams = teams.sorted(by: {$0.points > $1.points})
        completion()
    }
}

// MARK: Helper functions
extension LeagueManager {
    func isLeagueEmpty() -> Bool {
        teams.isEmpty
    }
    
    func isLeagueEnded() -> Bool {
        !fixtures.isEmpty
    }
}
