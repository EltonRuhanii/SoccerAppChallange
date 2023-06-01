//
//  FixtureResultsViewController.swift
//  SoccerAppChallange
//
//  Created by WIZZARD on 31.5.23.
//

import UIKit

class FixtureResultsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private let resultCellIdentifier = "ResultCell"
    private let leagueManager = LeagueManager.currentLeague
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        setupTableView()
        leagueManager.generateResults {
            self.tableView.reloadData()
        }
    }
    
    @IBAction func showLeagueTable(_ sender: Any) {
        leagueManager.sortLeagueTable {
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
}

// MARK: - TABLE VIEW DATASOURCE
extension FixtureResultsViewController:  UITableViewDataSource {
    func setupTableView() {
        tableView.register(UINib(nibName: resultCellIdentifier,
                                      bundle: nil),
                                forCellReuseIdentifier: resultCellIdentifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leagueManager.fixtures.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: resultCellIdentifier,
                                                 for: indexPath) as! ResultCell
        
        let fixture = leagueManager.fixtures[indexPath.row]
        cell.set(fixture: fixture)
        
        return cell
    }
}

