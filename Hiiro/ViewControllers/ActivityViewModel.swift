//
//  ActivityViewModel.swift
//  Hiiro
//
//  Created by Vitaly on 25.05.2024.
//

import Foundation
import SwiftUI



protocol ActivityViewModelProtocol: ObservableObject {

    var visibleActivitis: [Activity] { get }
    var dateComponents: [DateComponent] { get }
    var titleDate: String { get }
    
    func selectDateComponent(day: DateComponent)
}


final class ActivityViewModel: ActivityViewModelProtocol {

    private var activitis: [Activity] = []
    @Published var visibleActivitis: [Activity] = []
    @Published var dateComponents: [DateComponent] = []
    @Published var titleDate: String = ""

    init() {
        activitis = self.loadActivities("ac.json")
        dateComponents = self.loadDates()
        visibleActivitis = activitis
        titleDate = ActivityDate(Date()).titleDate
    }

    func selectDateComponent(day: DateComponent) {

        for index in 0..<dateComponents.count {
            if dateComponents[index].activeDate.date == day.activeDate.date {
                dateComponents[index].isSelected = true
            } else {
                dateComponents[index].isSelected = false
            }
        }
        
        createVisibleActivityList(date: day.activeDate.date)
        titleDate = day.activeDate.titleDate
    }
    
    
    /// функция формирует список активностей на текущий день
    private func createVisibleActivityList(date: Date) {
        guard let date = date.startOfDay() else { return }
        visibleActivitis = activitis.filter {$0.activeDate.date == date}
    }

    /// Функция подготовливает массив с датами
    private func loadDates() -> [DateComponent] {
        var dates: [DateComponent] = []
       
        // (сделать на 3 недели - текущую, предыдущую и будущую). "20/05/2024"  - первый день в этом периоде
        let startDate = Date().startOfDay()?.addingTimeInterval( 3600 * 24 * Double(7) * (-1) )//
        guard let startDate = startDate else { return [] }

        // 21 день = 3 недели
        (0...20).forEach { i in
            
            let nextDate: TimeInterval = 3600 * 24 * Double(i)
            let nextActivityDate = ActivityDate(startDate.addingTimeInterval(nextDate) )
            
            let isActiveDay = activitis.filter({$0.activeDate.date == nextActivityDate.date}).count > 0
                
            let dateComponet = DateComponent(id: i, activeDate: nextActivityDate, isActiveDat: isActiveDay, isSelected: false)
            dates.append(dateComponet)
        }
        return dates
    }
    
    /// Функция загружает данные об активностях из json filename
    private func loadActivities<T: Decodable>(_ filename: String) -> T {
        let data: Data
        
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
        }

        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }
        
        do {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd/MM/yyyy"
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .formatted(formatter)
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
        }
        
    }
}


