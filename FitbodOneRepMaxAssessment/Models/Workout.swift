//
//  Workout.swift
//  FitbodOneRepMaxAssessment
//
//  Created by Colton Lemmon on 3/21/21.
//

import Foundation

struct Workout {
    let date: Date
    let name: String
    let sets: Double
    let reps: Double
    let weight: Double
    
    var oneRepMax: Double {
        return (weight * (36 / (37 - reps))).rounded()
    }
    
    init(date: String, name: String, sets: String, reps: String, weight: String) {
        self.name = name
        self.date = ORMDateFormatter.formatDate(from: date) ?? Date()
        self.sets = Double(sets) ?? 0
        self.reps = Double(reps) ?? 0
        self.weight = Double(weight) ?? 0
    }
}
