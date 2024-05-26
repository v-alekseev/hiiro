//
//  ActivityModel.swift
//  Hiiro
//
//  Created by Vitaly on 25.05.2024.
//

import Foundation
import SwiftUI

struct Activity: Hashable, Codable, Identifiable {
    var id: Int
    private var date: Date
    var activeDate: ActivityDate  {
        ActivityDate(date)
    }

    private var iconName: String
    
    var image: Image {
        Image(iconName)
    }
    var name: String
    var text1: String
    var text2: String
    
    init(id: Int, date: Date, iconName: String, name: String, text1: String, text2: String) {
        self.id = id
        self.date = date
        self.iconName = iconName
        self.name = name
        self.text1 = text1
        self.text2 = text2
    }

}
