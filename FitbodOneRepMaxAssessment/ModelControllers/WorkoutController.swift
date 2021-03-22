//
//  WorkoutController.swift
//  FitbodOneRepMaxAssessment
//
//  Created by Colton Lemmon on 3/19/21.
//

import Foundation

struct WorkoutController {
    
    // Loads workoutData file as String, extracts each line break into array of Strings.
    static func loadHistory(completion: @escaping(Result<[ExerciseHistory], WorkoutError>)->()) {
        var arrayOfStrings = [String]()
        guard let path = Bundle.main.path(forResource: "workoutData", ofType: "txt") else {
            completion(.failure(.badPath))
            return
        }
        do {
            let data = try String(contentsOfFile: path, encoding: .utf8)
            arrayOfStrings = data.components(separatedBy: "\n")
        } catch {
            completion(.failure(.badFile))
            return
        }
        let workouts = workoutsFrom(strings: arrayOfStrings)
        let history = historyFrom(workouts: workouts)
        completion(.success(history))
    }
    
    // Takes list of "workout" strings, extracts individual values and builds Workout object.
    private static func workoutsFrom(strings: [String]) -> [Workout] {
        return strings.compactMap({
            let workoutStringArr = $0.components(separatedBy: ",")
            
            // If count != 5, it doesn't match expected input.
            guard workoutStringArr.count == 5 else { return nil }
            
            return Workout(date: workoutStringArr[0],
                           name: workoutStringArr[1],
                           sets: workoutStringArr[2],
                           reps: workoutStringArr[3],
                           weight: workoutStringArr[4])
        })
        .sorted(by: {$0.date.timeIntervalSince1970 < $1.date.timeIntervalSince1970})
    }
    
    // Sorts all workouts into dictionary based on name, then creates list of ExerciseHistory objects.
    private static func historyFrom(workouts: [Workout]) -> [ExerciseHistory] {
        let exerciseNameDict = workouts.reduce(into: [String: [Workout]]()) {
            $0[$1.name, default: []].append($1)
        }
        return exerciseNameDict.map({ ExerciseHistory(name: $0.key, history: $0.value)})
    }
}
