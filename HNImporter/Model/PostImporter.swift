//
//  PostImporter.swift
//  HNImporter
//
//  Created by Chad Parker on 4/18/21.
//

import Foundation

class PostImporter: ObservableObject {
    
    @Published var fileCountProgress = 0
    @Published var fileCountTotal = 0
    @Published var postsImportedCount = 0
    
    let backgroundQueue = DispatchQueue(label: "PostImporterQueue", qos: .userInitiated)
    
    lazy var calendar: Calendar = {
        var cal = Calendar.current
        cal.timeZone = TimeZone(secondsFromGMT: 0)!
        return cal
    }()
    
    func importFromJS() {
        
        // temporary deleteAll for now. more checking & UI later.
        do {
            try dbQueue.write { db in
                _ = try Post.deleteAll(db)
            }
        } catch {
            fatalError("read error")
        }
        
        backgroundQueue.async { [self] in
            var idsSeen = Set<String>()
            
            let filePaths = getDataFilePaths()
            DispatchQueue.main.async {
                fileCountTotal = filePaths.count
            }
            for (index, filePath) in filePaths.enumerated() {
                let url = URL(fileURLWithPath: filePath)
                let data = try! Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .secondsSince1970
                let posts = try! decoder.decode([Post].self, from: data)
                
                for var post in posts {
                    if !idsSeen.contains(post.id) {
                        do {
                            try dbQueue.write { db in
                                try! post.insert(db)
                            }
                        } catch {
                            print("\(error)")
                        }
                        idsSeen.insert(post.id)
                    }
                }
                DispatchQueue.main.async {
                    fileCountProgress = index + 1
                    postsImportedCount = idsSeen.count
                }
            }
        }
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
