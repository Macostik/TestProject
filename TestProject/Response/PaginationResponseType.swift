//
//  PaginationResponseType.swift
//  TestProject
//
//  Created by Yura Granchenko on 11/25/18.
//  Copyright © 2018 Yura Granchenko. All rights reserved.
//

import Foundation
import Himotoki

protocol PaginationResponse {
    associatedtype Element: Decodable
    var elements: [Element] { get }
    var page: Int { get }
    init(elements: [Element], page: Int)
}

struct AnyPaginationResponse<Element: Decodable>: PaginationResponse {
    let elements: [Element]
    let page: Int
    
    init<Response: PaginationResponse>(response: Response) where Response.Element == Element {
        elements = response.elements
        page = response.page
    }
    
    init(elements: [Element], page: Int) {
        self.elements = elements
        self.page = page
    }
}
