//
//  RepoModel.swift
//  StarredRepos
//
//  Created by abdrahman on 11/04/2022.
//

import Foundation

struct ReposList: Codable{
//    let totalCount: Int
//    let incompleteResults: bool
    let items: [Repo]
//    enum CodingKeys: String, CodingKey {
//        case totalCount = "total_count"
//        case incompleteResults = "incomplete_results"
//        case items
//    }
}

struct Repo: Codable{
    let name: String
    let fullName: String
    let owner: Owner
    //let itemDescription: String
    let stargazersCount: Int
    let openIssuesCount: Int
    enum CodingKeys: String, CodingKey {
        case name
        case fullName = "full_name"
        case owner
        //case itemDescription = "description"
        case stargazersCount = "stargazers_count"

        case openIssuesCount = "open_issues_count"
    }

}

struct Owner: Codable {

    let avatarURL: String


    enum CodingKeys: String, CodingKey {

        case avatarURL = "avatar_url"

    }
}
//
//struct Owner: Codable{
//
//}

//struct ReposList: Codable {
//    let totalCount: Int
//    let incompleteResults: Bool
//    let items: [Repo]
//
//    enum CodingKeys: String, CodingKey {
//        case totalCount = "total_count"
//        case incompleteResults = "incomplete_results"
//        case items
//    }
//}
//
//// MARK: - Item
//struct Repo: Codable {
//
//    let name, fullName: String
//
//    let owner: Owner
//
//    let itemDescription: String
//
//    let stargazersCount: Int
//    let openIssuesCount: Int
//
//    enum CodingKeys: String, CodingKey {
//
//        case name
//        case fullName = "full_name"
//
//        case owner
//
//        case itemDescription = "description"
//
//
//        case stargazersCount = "stargazers_count"
//
//        case openIssuesCount = "open_issues_count"
//
//    }
//}
//
//
//// MARK: - Owner
//struct Owner: Codable {
//
//    let avatarURL: String
//
//
//    enum CodingKeys: String, CodingKey {
//
//        case avatarURL = "avatar_url"
//
//    }
//}



extension ReposList{
    // https://api.github.com/search/repositories?q=created:>2022-04-10&sort=stars&order=desc&page=2
    static var allRepos: Resource<ReposList>? = {
        
        if let url = URL(string: "https://api.github.com/search/repositories?q=created:2020-01-01&sort=stars&order=desc&page=1") {
            //print("error url")
            return Resource<ReposList>(url: url)
        }else{
            print("error url")
        }
        return nil
    }()
}

