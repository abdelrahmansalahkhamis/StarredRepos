//
//  RepoModel.swift
//  StarredRepos
//
//  Created by abdrahman on 11/04/2022.
//

import Foundation

struct ReposList: Codable{
    
    let items: [Repo]

}

struct Repo: Codable{
    let name: String
    let fullName: String
    let owner: Owner
    //let description: String
    let stargazersCount: Int
    let openIssuesCount: Int
    let createdAt: String
    enum CodingKeys: String, CodingKey {
        case name
        case fullName = "full_name"
        case owner
        //case description = "description"
        case stargazersCount = "stargazers_count"

        case openIssuesCount = "open_issues_count"
        case createdAt = "created_at"
    }

}

struct Owner: Codable {

    let avatarURL: String
    let login: String

    enum CodingKeys: String, CodingKey {

        case avatarURL = "avatar_url"
        case login
    }
}

extension ReposList{
    // https://api.github.com/search/repositories?q=created:>2022-04-10&sort=stars&order=desc&page=2
    static var allRepos: Resource<ReposList> = {
        
        guard let url = URL(string: URLs.allRepos) else{
            fatalError("incorrect url")
            //print("error url")
        }
            print("url is :- \(url)")
            return Resource<ReposList>(url: url)
        
    }()
}

