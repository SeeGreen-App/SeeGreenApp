//
//  LocalStorage.swift
//  SeeGreenApp
//
//  Created by student on 12/7/21.
//

import Foundation

struct LocalStorage {
    var userPlant:Plants
    
    static var documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    static var archiveUrl = documentsDirectory.appendingPathComponent("Plants-List").appendingPathExtension("plist")
    
    static var savedUrl = documentsDirectory.appendingPathComponent("Last-date").appendingPathExtension("plist")
        
    static func loadDateFromFile() -> Int {
        let decoder = PropertyListDecoder()
        
        if let retrieveLastDate = try? Data(contentsOf: savedUrl), let decodedLastDate = try? decoder.decode(Int.self, from: retrieveLastDate) {
            return decodedLastDate
        }
        return -1
    }
    
    static func saveToFile(plantsList: [Plants]) {
        let encoder = PropertyListEncoder()
        
        let encodedPlantsList = try? encoder.encode(plantsList)
        try? encodedPlantsList?.write(to: archiveUrl)
    }
    
    static func loadFromFile() -> [Plants]? {
        let decoder = PropertyListDecoder()
        if let retrivePlantsList = try? Data(contentsOf: archiveUrl), let decodedPlantsList = try? decoder.decode([Plants].self, from: retrivePlantsList) {
            return decodedPlantsList
        }
        return nil
    }
}
