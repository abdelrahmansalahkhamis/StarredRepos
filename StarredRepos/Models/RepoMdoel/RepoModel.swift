//
//  RepoModel.swift
//  StarredRepos
//
//  Created by abdrahman on 11/04/2022.
//

import Foundation

struct ReposList:Codable{
    let items:[Repo]
}

struct Repo:Codable{
    
    let name:String?
    let description:String?
    let stargazersCount:Int?
    let openIssuesCount:Int?
    let craetedAt:String?
    let owner:Owner
    
    enum CodingKeys: String, CodingKey {
        case name
        case description
        case stargazersCount = "stargazers_count"
        case owner
        case openIssuesCount = "open_issues_count"
        case craetedAt = "created_at"
    }
}

struct Owner:Codable{
    let login:String?
    let avatarURL:String?
    
    enum CodingKeys: String, CodingKey {
        case login
        case avatarURL = "avatar_url"
    }
}


extension ReposList{
    // https://api.github.com/search/repositories?q=created:>2022-04-10&sort=stars&order=desc&page=2
    static func getAllRepos(pageNumber: Int) -> Resource<ReposList>{
        guard let url = URL(string: URLs.allRepos + "\(pageNumber)") else{
            fatalError("incorrect url")
        }
        return Resource<ReposList>(url: url)
    }

}
