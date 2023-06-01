//
//  LeagueResultsViewController.swift
//  SoccerAppChallange
//
//  Created by WIZZARD on 31.5.23.
//

import UIKit

class LeagueResultsViewController: UIViewController {
    // MARK: PROPERTIES
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nextButton: UIButton!
    
    private let teamCellIdentifier = "TeamCell"
    private let leagueManager = LeagueManager.currentLeague
    
    // MARK: - BODY
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateButtonTitle()
    }
    
    @IBAction func generateFixturesTapped(_ sender: Any) {
        if leagueManager.isLeagueEmpty() || leagueManager.isLeagueEnded() {
            leagueManager.generateTeams(count: 20)
            updateButtonTitle()
        } else {
            if let fixturesVC = storyboard?.instantiateViewController(identifier: "FixturesViewController") as? FixturesViewController {
                self.navigationController?.pushViewController(fixturesVC, animated: true)
            }
        }
    }
}

// MARK: - TABLE VIEW DATASOURCE
extension LeagueResultsViewController:  UITableViewDataSource {
    func setupTableView() {
        tableView.register(UINib(nibName: teamCellIdentifier,
                                 bundle: nil),
                           forCellReuseIdentifier: teamCellIdentifier)
        tableView.backgroundColor = UIColor.clear
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        leagueManager.teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: teamCellIdentifier,
                                                 for: indexPath) as! TeamCell
        let team = leagueManager.teams[indexPath.row]
        cell.set(team: team, index: indexPath.row + 1)
        
        return cell
    }
}

// MARK: - FUNCTIONS
extension LeagueResultsViewController {
    func updateButtonTitle() {
        let isGenerateTeams = leagueManager.isLeagueEmpty() || leagueManager.isLeagueEnded()
        nextButton.setTitle(isGenerateTeams ? "Generate Teams" : "Generate Fixtures", for: .normal)
        UIView.animate(withDuration: 1.5) {
            self.tableView.reloadData()
        }
    }
}

