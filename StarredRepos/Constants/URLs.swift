//
//  URLs.swift
//  StarredRepos
//
//  Created by abdrahman on 12/04/2022.
//

import Foundation
struct URLs{
    //static let main =  "https://api.github.com/search/repositories?q=created:%3E2017-10-22&sort=stars&ord%20er=desc"
    static let main = "https://api.github.com/search/repositories"
    static let allRepos = main + "?" + "q=created:%3E" + getLast30DaysDate() + "&sort=stars&order=desc&page="
    static func getLast30DaysDate() -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.locale = Locale(identifier: "fr_FR")
        let stringDate = formatter.string(from: (Date() - 30))
        return stringDate
    }
}
