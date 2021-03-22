//
//  DateValueFormatter.swift
//  FitbodOneRepMaxAssessment
//
//  Created by Colton Lemmon on 3/21/21.
//

import Foundation
import Charts

class DateValueFormatter: NSObject, IAxisValueFormatter {
    private var dateFormatter: DateFormatter?
    private var referenceTimeInterval: TimeInterval?
    
    convenience init(dateFormatter: DateFormatter, referenceTimeInterval: TimeInterval) {
        self.init()
        self.dateFormatter = dateFormatter
        self.referenceTimeInterval = referenceTimeInterval
        dateFormatter.dateFormat = "MMM dd"
        dateFormatter.locale = Locale.current
    }
    
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        guard let dateFormatter = dateFormatter,
              let referenceTimeInterval = referenceTimeInterval else { return "" }
        return dateFormatter.string(from: Date(timeIntervalSince1970: value*3600*24 + referenceTimeInterval))
    }
}
