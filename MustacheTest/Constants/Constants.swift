//
//  Constants.swift
//  MustacheTest
//
//  Created by Colstin Donaldson on 5/4/23.
//

import Foundation

class Constants {
    
    static var models = ["Mustache1", "Mustache2", "Mustache3"]

    static var models2: [String] = {
       
        let fileManager = FileManager.default
        
        guard let path = Bundle.main.resourcePath, let files = try? fileManager.contentsOfDirectory(atPath: path) else {
            return []
        }
        
        var availableModels:[String] = []
        for fileName in files where
        fileName.hasSuffix("usdz") {
            let modelName = fileName.replacingOccurrences(of: ".usdz", with: "")
            availableModels.append(modelName)
        }
        return availableModels
    }()
}
