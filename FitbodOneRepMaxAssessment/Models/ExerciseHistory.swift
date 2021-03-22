//
//  ExerciseHistory.swift
//  FitbodOneRepMaxAssessment
//
//  Created by Colton Lemmon on 3/21/21.
//

import Foundation

struct ExerciseHistory {
    let name: String
    var history: [Workout]
    let overallORM: Double?
    
    init(name: String, history: [Workout]) {
        self.name = name
        self.overallORM = history.map({$0.oneRepMax}).max()
        self.history = history
    }
}
