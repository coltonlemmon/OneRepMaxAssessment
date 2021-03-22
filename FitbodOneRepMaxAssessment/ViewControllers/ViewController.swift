//
//  ViewController.swift
//  FitbodOneRepMaxAssessment
//
//  Created by Colton Lemmon on 3/19/21.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Internal Properties
    
    let segueID = "detailSegue"
    var history = [ExerciseHistory]()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupHistory()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == segueID,
              let chartVC = segue.destination as? ChartViewController,
              let indexPath = tableView.indexPathForSelectedRow
        else { return }
        chartVC.setupView(with: history[indexPath.row])
    }

    // MARK: - View Setup
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    private func setupHistory() {
        WorkoutController.loadHistory { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let history):
                self.history = history
                self.tableView.reloadData()
            case .failure(let error):
                self.invokeAlert(title: "Workout Error", message: error.localizedDescription)
            }
        }
    }
    
    private func invokeAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }

}

// MARK: - UITableViewDelegate & UITableViewDataSource

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  history.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "oneRepMaxCell", for: indexPath) as? OneRepMaxTableViewCell else { return UITableViewCell() }
        cell.setupCell(from:  history[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: segueID, sender: self)
    }
}
