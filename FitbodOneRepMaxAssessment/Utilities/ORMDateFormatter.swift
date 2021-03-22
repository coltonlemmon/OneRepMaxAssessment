//
//  ORMDateFormatter.swift
//  FitbodOneRepMaxAssessment
//
//  Created by Colton Lemmon on 3/21/21.
//

import Foundation

struct ORMDateFormatter {
    static let dateFormatter = DateFormatter()
    static func formatDate(from string: String) -> Date? {
        dateFormatter.dateFormat = "MMM dd yyyy"
        return dateFormatter.date(from: string)
    }
}
