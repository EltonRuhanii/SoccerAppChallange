//
//  TeamCell.swift
//  SoccerAppChallange
//
//  Created by WIZZARD on 31.5.23.
//

import UIKit

class TeamCell: UITableViewCell {
    @IBOutlet weak var teamRanking: UILabel!
    @IBOutlet weak var teamLogo: UIImageView!
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var teamPoints: UILabel!
    @IBOutlet weak var teamGoalDifference: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func set(team: Team, index: Int) {
        teamRanking.text = "\(index)"
        teamName.text = team.name
        teamLogo.image = UIImage(systemName:"soccerball")
        teamLogo.tintColor = UIColor.colorFromHexString(team.logo)
        teamPoints.text = "\(team.points)"
        teamGoalDifference.text = "\(team.goalScored):\(team.goalConceded)"
    }
}
