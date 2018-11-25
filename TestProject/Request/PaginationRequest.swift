//
//  PaginationRequest.swift
//  TestProject
//
//  Created by Yura on 11/25/18.
//  Copyright © 2018 Yura. All rights reserved.
//

import Foundation
import APIKit
import Himotoki

protocol PaginationRequest: Request {
    associatedtype Response: PaginationResponse
    var page: Int { get set }
}

extension PaginationRequest {
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response {
        let elements = try decodeArray(object, rootKeyPath: "hits") as [Response.Element]
        
        return Response(elements: elements, page: page)
    }
}
