//
//  ChartViewController.swift
//  FitbodOneRepMaxAssessment
//
//  Created by Colton Lemmon on 3/19/21.
//

import UIKit
import Charts

class ChartViewController: UIViewController, Chartable {
    
    // MARK: - Outlets
    
    @IBOutlet weak var lineChartView: LineChartView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    // MARK: - Internal Properties
    
    var exerciseHistory: ExerciseHistory?
    
    // MARK: - Dependency Injection
    
    func setupView(with exerciseHistory: ExerciseHistory) {
        self.exerciseHistory = exerciseHistory
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assert(exerciseHistory != nil, "setupView must be called from origin VC")
        setupSubviews()
        setupChart()
    }
    
    // MARK: - View Setup
    
    private func setupSubviews() {
        titleLabel.text = exerciseHistory?.name
        detailLabel.text = "One Rep Max • lbs"
        valueLabel.text = exerciseHistory?.overallORM?.stringValue
    }
    
    private func setupChart() {
        lineChartView.isUserInteractionEnabled = false
        let chartData = ChartDataFactory.exerciseLineChartData(from: exerciseHistory!)
        let dataSet = LineChartDataSet(entries: chartData)
        style(dataSet)
        setNumberFormatter(for: dataSet)
        lineChartView.data = LineChartData(dataSet: dataSet)
        let referenceTime: TimeInterval = exerciseHistory?.history.first?.date.timeIntervalSince1970 ?? 0
        design(lineChartView, referenceTime: referenceTime)
    }
}
