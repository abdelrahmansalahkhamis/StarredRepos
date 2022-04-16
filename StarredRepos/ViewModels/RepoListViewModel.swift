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

    
    private(set) var cells: [RepoCellViewModel] = []
    
    private let repoService: RepoServiceProtocol
    
    init(repoService: RepoServiceProtocol = WebService()) {
        self.repoService = repoService
    }
    
    func numberOfRows() -> Int{
        return cells.count
    }
    
    
    func cell(at indexPath: IndexPath) -> RepoCellViewModel{
        return cells[indexPath.row]
    }
}

extension ReposListViewModel{
    func loadRepos(_ pageNumber: Int){
        repoService.load(resource: ReposList.getAllRepos(pageNumber: pageNumber)) { result in
            switch result{
            case .success(let repos):
                self.cells += repos.items.map{
                    let reposCellViewModel = RepoCellViewModel($0)
                    
                    
                    return reposCellViewModel
                }
                self.onUpdate()
            case .failure(let error):
                print("error is => \(error)")
            }
        }
        
    }
}
