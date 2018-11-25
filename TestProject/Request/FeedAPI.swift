//
//  FeedAPI.swift
//  TestProject
//
//  Created by Yura on 11/25/18.
//  Copyright © 2018 Yura. All rights reserved.
//

import Foundation
import APIKit

final class FeedAPI {
    private init() {
        
    }
    
    struct SearchRepositoriesRequest: FeedRequest, PaginationRequest {
        
        let query: String
        var page: Int
        
        init(query: String, page: Int = 1) {
            self.query = query
            self.page = page
        }
        
        // MARK: RequestType
        typealias Response = SearchResponse<Feed>
        
        var method: HTTPMethod {
            return .get
        }
        
        var path: String {
            return "/search_by_date"
        }
        
        var parameters: Any? {
            return ["tags": query, "page": page]
        }
    }
}
