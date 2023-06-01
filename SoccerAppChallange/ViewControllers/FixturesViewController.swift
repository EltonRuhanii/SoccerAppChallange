//
//  FixturesViewController.swift
//  SoccerAppChallange
//
//  Created by WIZZARD on 31.5.23.
//

import UIKit

class FixturesViewController: UIViewController {
    // MARK: PROPERTIES
    @IBOutlet weak var tableView: UITableView!
    
    private let fixtureCellIdentifier = "FixtureCell"
    private let leagueManager = LeagueManager.currentLeague
    
    // MARK: - BODY
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        setupTableView()
        leagueManager.createLeagueFixtures()
    }
    
    @IBAction func playAllMatchesPressed(_ sender: Any) {
        if let resultsVC = storyboard?.instantiateViewController(identifier: "FixtureResultsViewController") as? FixtureResultsViewController {
            self.navigationController?.pushViewController(resultsVC, animated: true)
        }
    }
    
    
}

// MARK: - TABLE VIEW DATASOURCE
extension FixturesViewController:  UITableViewDataSource {
    func setupTableView() {
        tableView.register(UINib(nibName: fixtureCellIdentifier,
                                 bundle: nil),
                           forCellReuseIdentifier: fixtureCellIdentifier)
        tableView.backgroundColor = UIColor.clear
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        leagueManager.fixtures.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: fixtureCellIdentifier,
                                                 for: indexPath) as! FixtureCell
        
        let fixture = leagueManager.fixtures[indexPath.row]
        cell.set(fixture: fixture)
        
        return cell
    }
}
