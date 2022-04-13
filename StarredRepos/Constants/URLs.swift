//
//  URLs.swift
//  StarredRepos
//
//  Created by abdrahman on 12/04/2022.
//

import Foundation
struct URLs{
    
    static let main = "https://api.github.com/search/repositories"
    static let allRepos = main + "?" + "q=created:" + getLast30DaysDate() + "&sort=stars&order=desc&page=1"
    // q=created:2020-01-01&sort=stars&order=desc&page=1
    static func getLast30DaysDate() -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.locale = Locale(identifier: "fr_FR")
        let stringDate = formatter.string(from: (Date() - 30))
        return stringDate
    }
}
