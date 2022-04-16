//
//  ReposListVC.swift
//  StarredRepos
//
//  Created by abdrahman on 11/04/2022.
//

import UIKit

class ReposListVC: UITableViewController {
    
    var repoListViewModel =  ReposListViewModel()
    var totalItems = 0
    var currentPage = 1
    
    var isLoading = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = repoListViewModel.title
        tableView.register(UINib(nibName: "LoadinngCell", bundle: nil), forCellReuseIdentifier: "LoadinngCell")
        tableView.register(UINib(nibName: "RepoCell", bundle: nil), forCellReuseIdentifier: "RepoCell")
        loadData()
        
    }

    func loadData(){
        repoListViewModel.loadRepos(currentPage)
        repoListViewModel.onUpdate = { [weak self] in
            self?.totalItems = self?.repoListViewModel.cells.count ?? 0
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0{
            return repoListViewModel.numberOfRows()
        }else if section == 1{
            return 1
        }else{
            return 0
        }
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let vm = repoListViewModel.cells[indexPath.row]

            let cell = tableView.dequeueReusableCell(withIdentifier: "RepoCell", for: indexPath) as! RepoCell
                cell.update(with: vm)
                return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "LoadinngCell", for: indexPath) as! LoadinngCell
            cell.activityIndicator.startAnimating()
            return cell
        }
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 180
        }else{
            return 70
        }
        
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == repoListViewModel.cells.count - 1{
            if repoListViewModel.cells.count <= totalItems {
                self.currentPage += 1
                loadData()
                print("currentPage is :- \(currentPage)")
            }
        }
    }
}
