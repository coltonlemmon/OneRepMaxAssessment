//
//  WorkoutError.swift
//  FitbodOneRepMaxAssessment
//
//  Created by Colton Lemmon on 3/22/21.
//

import Foundation

enum WorkoutError: Error, LocalizedError {
    case badPath
    case badFile
    
    var errorDescription: String? {
        switch self {
        case .badPath:
            return "Invalid file path. File must be named \"workoutData.txt\" and be contained within the app bundle."
        case .badFile:
            return "Invalid file. There was an error parsing the text file."
        }
    }
}
