//
//  Post.swift
//  HNImporter
//
//  Created by Chad Parker on 4/17/21.
//

import Foundation
import GRDB

struct Post {

    let id: String

    let link_text: String
    let link: String
    let submitter: String

    let type: String?
    let source: String?
    let dead: Bool

    let points: Int?
    let comments: Int?

    let date: Date
    let time: Date?
}

extension Post: Codable, FetchableRecord, MutablePersistableRecord {
    
}
