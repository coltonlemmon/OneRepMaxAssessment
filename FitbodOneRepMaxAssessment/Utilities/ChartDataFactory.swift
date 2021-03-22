//
//  ChartDataFactory.swift
//  FitbodOneRepMaxAssessment
//
//  Created by Colton Lemmon on 3/20/21.
//

import Foundation
import Charts

struct ChartDataFactory {
    // Converts ExerciseHistory object to ChartDataEntry for display in line chart.
    static func exerciseLineChartData(from exerciseHistory: ExerciseHistory) -> [ChartDataEntry] {
        let referenceTimeInterval = exerciseHistory.history.map({$0.date.timeIntervalSince1970}).min() ?? 0
        return exerciseHistory.history.map { (history) -> ChartDataEntry in
            ChartDataEntry(x: (history.date.timeIntervalSince1970 - referenceTimeInterval) / (3600 * 24), y: history.oneRepMax)
        }
    }
}
