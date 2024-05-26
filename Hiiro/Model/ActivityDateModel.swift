//
//  DateModel.swift
//  Hiiro
//
//  Created by Vitaly on 25.05.2024.
//

import Foundation
import SwiftUI

struct ActivityDate {
    let date: Date
    private let dateFormatter = DateFormatter()

    var day: String {
        dateFormatter.dateFormat = "dd"
        return dateFormatter.string(from: date)
    }
    var weekday: String{
        dateFormatter.dateFormat = "EE"
        return dateFormatter.string(from: date).uppercased()
    }
    var titleDate: String {
        dateFormatter.dateFormat = "MMM yyyy"

        return dateFormatter.string(from: date)
    }

    
    init(_ date: Date) {
        self.date = date
    }
    
    static func getDate(_ date: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"

        return dateFormatter.date(from: date)
    }
    
}

