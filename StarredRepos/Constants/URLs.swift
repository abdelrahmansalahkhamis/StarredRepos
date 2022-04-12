//
//  URLs.swift
//  StarredRepos
//
//  Created by abdrahman on 12/04/2022.
//

import Foundation
struct URLs{
    static let main = "https://api.github.com/search/repositories"
    static let allRepos = main + "?" + "q=created:>2017-10-22&sort=stars&ord er=desc&page=2"
    
}
