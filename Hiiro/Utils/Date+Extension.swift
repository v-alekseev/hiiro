//
//  Data+Extension.swift
//  Hiiro
//
//  Created by Vitaly on 26.05.2024.
//

import Foundation


extension Date{
    func startOfDay() -> Date? {
        return Locale.current.calendar.startOfDay(for: self)
    }
    
    static func getDateFromString(isoDate: String) -> Date? {
        let dateFormatter = ISO8601DateFormatter()
        return dateFormatter.date(from:isoDate)
    }
}
