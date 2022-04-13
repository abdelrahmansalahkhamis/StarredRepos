//
//  RepoCellViewModel.swift
//  StarredRepos
//
//  Created by abdrahman on 11/04/2022.
//

import Foundation
import UIKit


class RepoCellViewModel{
    private let repo: Repo
    
    init(_ repo: Repo) {
        self.repo = repo
    }
    var name:String{
        get{
            return self.repo.name
        }
    }

    var fullname: String{
        //return "--------"
        return self.repo.fullName
    }

    var userAvatar: String{
        //return "--------"
        return self.repo.owner.avatarURL
    }

    var itemDescription:String{
        return "--------"
        //return self.repo.itemDescription ?? ""
    }

    var stargazersCount:Int{
        //return 10
        return self.repo.stargazersCount
    }


    var openIssuesCount: Int{
        //return 15
        return self.repo.openIssuesCount
    }
    
    var timeInterval: Int{
        let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        //dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: self.repo.createdAt)
        let elapseTimeInSeconds = Date().timeIntervalSince(date ?? Date())
        // yyyy-MM-dd'T'HH:mm:ssZ
        // 2020-01-01T12:34:32Z
        return Int((elapseTimeInSeconds / (60.0 * 60.0 * 24.0)))
    }
    
    func loadAvatar(_ completion: @escaping((UIImage?) -> Void)){
        
//        guard let avatarUrl = userAvatar else{
//            completion(nil)
//            return
//        }
        let url = URL(string: userAvatar)!

            // Fetch Image Data
            if let data = try? Data(contentsOf: url) {
                // Create Image and Update Image View
                completion(UIImage(data: data))
            }
    }
    
}
