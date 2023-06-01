//
//  ResultViewController.swift
//  SoccerAppChallange
//
//  Created by WIZZARD on 1.6.23.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var homeTeamLogo: UIImageView!
    @IBOutlet weak var homeTeamName: UILabel!
    @IBOutlet weak var homeTeamGoals: UILabel!
    @IBOutlet weak var awayTeamLogo: UIImageView!
    @IBOutlet weak var awayTeamName: UILabel!
    @IBOutlet weak var awayTeamGoals: UILabel!
    @IBOutlet weak var teamsHolder: UIView!
    
    let leagueManager = LeagueManager.currentLeague
    var fixture: Fixture? = nil
    
    // MARK: - BODY
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        set(fixture: fixture ?? Fixture(homeTeam: Team(name: "", logo: ""), awayTeam: Team(name: "", logo: "")))
        setupUI()
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

// MARK: - FUNCTIONS
extension ResultViewController {
    func set(fixture: Fixture) {
        homeTeamLogo.image = UIImage(systemName:"soccerball")
        homeTeamLogo.tintColor = UIColor.colorFromHexString(fixture.homeTeam.logo)
        homeTeamName.text = fixture.homeTeam.name
        homeTeamGoals.text = "\(fixture.homeGoals)"
        awayTeamLogo.image = UIImage(systemName:"soccerball")
        awayTeamLogo.tintColor = UIColor.colorFromHexString(fixture.awayTeam.logo)
        awayTeamName.text = fixture.awayTeam.name
        awayTeamGoals.text = "\(fixture.awayGoals)"
    }
    
    func setupUI() {
        teamsHolder.layer.cornerRadius = 22
    }
}
