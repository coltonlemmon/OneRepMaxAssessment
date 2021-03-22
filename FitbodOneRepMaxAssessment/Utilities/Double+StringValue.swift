//
//  Double+StringValue.swift
//  FitbodOneRepMaxAssessment
//
//  Created by Colton Lemmon on 3/21/21.
//

import Foundation

extension Double {
    // Cleans up trailing zeros from rounded double.
    var stringValue: String {
        truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}
