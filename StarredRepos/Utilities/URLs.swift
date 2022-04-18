//
//  URLs.swift
//  StarredRepos
//
//  Created by abdrahman on 12/04/2022.
//

import Foundation
struct URLs{
    
    // return date of day before 30 days from current day
    static func getLast30DaysDate() -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.locale = Locale(identifier: "fr_FR")
        let stringDate = formatter.string(from: (Date() - 30))
        return stringDate
    }
    
    static func constructReposURL(page: Int) -> URL?{
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.github.com"
        components.path = "/search/repositories"
        components.queryItems = [
            URLQueryItem(name: "q", value: "created:>" + getLast30DaysDate()),
            URLQueryItem(name: "sort", value: "stars"),
            URLQueryItem(name: "order", value: "desc"),
            URLQueryItem(name: "page", value: "\(page)"),
            URLQueryItem(name: "per_page", value: "\(100)")
        ]
        return components.url
    }
}
