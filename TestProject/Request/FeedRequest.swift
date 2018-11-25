//
//  FeedRequest.swift
//  TestProject
//
//  Created by Yura on 11/25/18.
//  Copyright © 2018 Yura. All rights reserved.
//

import Foundation
import APIKit
import Himotoki

protocol FeedRequest: Request {}

extension FeedRequest {
    var baseURL: URL {
        return URL(string: "https://hn.algolia.com/api/v1")!
    }
}

extension FeedRequest where Feed: Decodable {
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response {
        return try decodeValue(object)
    }
}
