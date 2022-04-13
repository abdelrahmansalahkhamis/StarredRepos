//
//  RepoListViewModel.swift
//  StarredRepos
//
//  Created by abdrahman on 11/04/2022.
//

import Foundation



class ReposVM{
    let repoItem: Repo? = nil
}

class ReposListViewModel{
    let title = "Starred Repos"
    var onUpdate = {}
    enum Cell{
        case repo(RepoCellViewModel)
    }
    
    private(set) var cells: [Cell] = []
    
    private let repoService: RepoServiceProtocol
    
    init(repoService: RepoServiceProtocol = WebService()) {
        self.repoService = repoService
    }
    
    func numberOfRows() -> Int{
        return cells.count
    }
    
    
    func cell(at indexPath: IndexPath) -> Cell{
        return cells[indexPath.row]
    }
}

extension ReposListViewModel{
    func loadRepos(){
        repoService.load(resource: ReposList.allRepos) { result in
            switch result{
            case .success(let repos):
                self.cells = repos.items.map{
                    let reposCellViewModel = RepoCellViewModel($0)
                    
                    
                    return .repo(reposCellViewModel)
                }
                self.onUpdate()
            case .failure(let error):
                print("error is => \(error)")
//                activityIndicator.stopAnimating()
            }
        }
        
    }
    
//    func sportViewModel(at index: Int) -> ReposVM{
//        return self.cells[index]
//    }
}
