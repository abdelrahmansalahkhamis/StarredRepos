//
//  RepoCellViewModel.swift
//  StarredRepos
//
//  Created by abdrahman on 11/04/2022.
//

import Foundation


class RepoCellViewModel{
    private let repo: Repo
    
    init(_ repo: Repo) {
        self.repo = repo
    }
    var name:String{
        return self.repo.name ?? ""
    }
    var userAvatar: String{
        return self.repo.owner.avatarURL ?? ""
    }
    
    var username: String{
        return self.repo.owner.login ?? ""
    }

    var itemDescription:String{
        return self.repo.description ?? ""
    }

    var stargazersCount:Int{
        return self.repo.stargazersCount ?? 0
    }


    var openIssuesCount: Int{
        return self.repo.openIssuesCount ?? 0
    }
    
    var timeInterval: Int{
        let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from: self.repo.craetedAt ?? "")
        let elapseTimeInSeconds = Date().timeIntervalSince(date ?? Date())
        // yyyy-MM-dd'T'HH:mm:ssZ
        // 2020-01-01T12:34:32Z
        return Int((elapseTimeInSeconds / (60.0 * 60.0 * 24.0)))
    }
}
