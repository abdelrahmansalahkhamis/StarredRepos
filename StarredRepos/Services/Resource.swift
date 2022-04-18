//
//  Resource.swift
//  StarredRepos
//
//  Created by abdrahman on 11/04/2022.
//

import Foundation

enum NetworkError: Error{
    case decodingError
    case domainError
    case urlError
}

enum HttpMethod: String{
    case get = "GET"
    case post = "POST"
}

struct Resource<T: Codable> {
    let url: URL
    var httpMethod: HttpMethod = .get
    var body: Data? = nil
}
