//
//  OneRepMaxTableViewCell.swift
//  FitbodOneRepMaxAssessment
//
//  Created by Colton Lemmon on 3/19/21.
//

import UIKit

class OneRepMaxTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    // MARK: - Setup
    
    func setupCell(from exercise: ExerciseHistory) {
        nameLabel.text = exercise.name
        valueLabel.text = exercise.overallORM?.stringValue
        detailLabel.text = "One Rep Max • lbs"
        self.accessoryType = .disclosureIndicator
    }
}
