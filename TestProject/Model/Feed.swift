//
//  Feed.swift
//  TestProject
//
//  Created by Yura on 11/25/18.
//  Copyright © 2018 Yura. All rights reserved.
//

import Foundation
import Himotoki

struct Feed: Decodable {
    let title: String
    let created_at: String
    
    static func decode(_ e: Extractor) throws -> Feed {
        return try Feed (
            title:              e <| "title",
            created_at:         e <| "created_at"
        )
    }
}
