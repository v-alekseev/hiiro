//
//  DateComponentModel.swift
//  Hiiro
//
//  Created by Vitaly on 26.05.2024.
//

import Foundation


struct DateComponent: Identifiable {
    var id: Int
    
    let activeDate: ActivityDate
    var isActiveDat: Bool
    var isSelected: Bool
    
    init(id: Int, activeDate: ActivityDate, isActiveDat: Bool, isSelected: Bool) {
        self.id = id
        self.activeDate = activeDate
        self.isActiveDat = isActiveDat
        self.isSelected = isSelected
    }
}
