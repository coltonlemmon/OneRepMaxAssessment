//
//  Chartable.swift
//  FitbodOneRepMaxAssessment
//
//  Created by Colton Lemmon on 3/21/21.
//

import Foundation
import Charts

protocol Chartable {}

// Chartable contains all of the specific styling and design for charts so we can have consistent charts everywhere.
extension Chartable {
    func setNumberFormatter(for dataSet: ChartDataSet) {
        let format = NumberFormatter()
        format.maximumFractionDigits = 0
        format.numberStyle = .none
        let formatter = DefaultValueFormatter(formatter: format)
        dataSet.valueFormatter = formatter
    }
    
    func style(_ dataSet: LineChartDataSet) {
        dataSet.axisDependency = .left
        dataSet.colors = [UIColor.label]
        dataSet.circleColors = [UIColor.label]
        dataSet.circleHoleColor = UIColor.systemBackground
        dataSet.circleHoleRadius = 1
        dataSet.circleRadius = 3
        dataSet.lineWidth = 1
    }
    
    func design(_ lineChart: LineChartView, referenceTime: TimeInterval) {
        lineChart.legend.enabled = false
        setup(xAxis: lineChart.xAxis, referenceTime: referenceTime)
        style(lineChart.leftAxis, and: lineChart.rightAxis)
        lineChart.legend.form = .line
    }
    
    func setup(xAxis: XAxis, referenceTime: TimeInterval) {
        let dateFormatter = DateFormatter()
        style(xAxis, with: dateFormatter, and: referenceTime)
    }
    
    func style(_ leftAxis: YAxis, and rightAxis: YAxis) {
        leftAxis.drawLabelsEnabled = false
        leftAxis.drawGridLinesEnabled = false
        leftAxis.drawAxisLineEnabled = false
        leftAxis.granularityEnabled = true
        
        rightAxis.labelCount = 3
        rightAxis.labelPosition = .outsideChart
        rightAxis.labelFont = .systemFont(ofSize: 13, weight: .regular)
        rightAxis.labelTextColor = .secondaryLabel
        
        rightAxis.drawGridLinesEnabled = false
        rightAxis.drawAxisLineEnabled = false
    }
    
    func style(_ xAxis: XAxis, with dateFormatter: DateFormatter, and referenceTimeInterval: TimeInterval) {
        xAxis.valueFormatter = DateValueFormatter(dateFormatter: dateFormatter, referenceTimeInterval: referenceTimeInterval)
        
        xAxis.labelPosition = .bottom
        xAxis.labelFont = .systemFont(ofSize: 13, weight: .regular)
        xAxis.labelTextColor = .secondaryLabel
        
        xAxis.drawAxisLineEnabled = false
        xAxis.drawGridLinesEnabled = false
        xAxis.avoidFirstLastClippingEnabled = true
    }
}
