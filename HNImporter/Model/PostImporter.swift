//
//  PostImporter.swift
//  HNImporter
//
//  Created by Chad Parker on 4/18/21.
//

import Foundation

class PostImporter {
    
    lazy var calendar: Calendar = {
        var cal = Calendar.current
        cal.timeZone = TimeZone(secondsFromGMT: 0)!
        return cal
    }()
    
    func importFromJS() {
        
    }
    
    func getDataFilePaths() -> [String] {
        let path = "\(Bundle.main.resourcePath!)/data/"
        
        do {
            let filenames = try FileManager.default.contentsOfDirectory(atPath: path)
            return filenames.map { path + $0 }
        } catch {
            fatalError()
        }
    }
}
