//
//  FixtureCell.swift
//  SoccerAppChallange
//
//  Created by WIZZARD on 31.5.23.
//

import UIKit

class FixtureCell: UITableViewCell {
    @IBOutlet weak var homeTeamLogo: UIImageView!
    @IBOutlet weak var homeTeamName: UILabel!
    @IBOutlet weak var awayTeamLogo: UIImageView!
    @IBOutlet weak var awayTeamName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func set(fixture: Fixture) {
        homeTeamLogo.image = UIImage(systemName:"soccerball")
        homeTeamLogo.tintColor = UIColor.colorFromHexString(fixture.homeTeam.logo)
        homeTeamName.text = fixture.homeTeam.name
        awayTeamLogo.image = UIImage(systemName:"soccerball")
        awayTeamLogo.tintColor = UIColor.colorFromHexString(fixture.awayTeam.logo)
        awayTeamName.text = fixture.awayTeam.name
    }
}
