//
//  ActivitiesDataProvider.swift
//  Hiiro
//
//  Created by Vitaly on 26.05.2024.
//

import Foundation

protocol ActivitiesDataProviderProtocol {
    func loadActivities<T: Decodable>(_ filename: String) -> T
}

final class ActivitiesDataProvider: ActivitiesDataProviderProtocol {

    /// Функция загружает данные об активностях из json filename
    internal func loadActivities<T: Decodable>(_ filename: String) -> T {
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
