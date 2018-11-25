//
//  PaginationResponse.swift
//  TestProject
//
//  Created by Yura Granchenko on 11/25/18.
//  Copyright © 2018 Yura Granchenko. All rights reserved.
//

import Foundation

struct SearchResponse<Element: Decodable>: PaginationResponse {
    let elements: [Element]
    let page: Int
}
