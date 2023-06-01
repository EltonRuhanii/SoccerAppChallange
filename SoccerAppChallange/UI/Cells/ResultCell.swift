//
//  ResultCell.swift
//  SoccerAppChallange
//
//  Created by WIZZARD on 31.5.23.
//

import UIKit

class ResultCell: UITableViewCell {
    @IBOutlet weak var homeTeamLogo: UIImageView!
    @IBOutlet weak var homeTeamName: UILabel!
    @IBOutlet weak var homeTeamScore: UILabel!
    @IBOutlet weak var awayTeamScore: UILabel!
    @IBOutlet weak var awayTeamName: UILabel!
    @IBOutlet weak var awayTeamLogo: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func set(fixture: Fixture) {
        homeTeamLogo.image = UIImage(systemName:"soccerball")
        homeTeamLogo.tintColor = UIColor.colorFromHexString(fixture.homeTeam.logo)
        homeTeamName.text = fixture.homeTeam.name
        homeTeamScore.text = "\(fixture.homeGoals)"
        awayTeamLogo.image = UIImage(systemName:"soccerball")
        awayTeamLogo.tintColor = UIColor.colorFromHexString(fixture.awayTeam.logo)
        awayTeamName.text = fixture.awayTeam.name
        awayTeamScore.text = "\(fixture.awayGoals)"
        if !fixture.isDraw {
            fixture.isHomeTeamWinner ? (homeTeamScore.textColor = .green) : (awayTeamScore.textColor = .green)
        }
    }
}
