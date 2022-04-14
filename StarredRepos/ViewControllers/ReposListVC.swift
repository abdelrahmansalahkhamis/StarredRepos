//
//  ReposListVC.swift
//  StarredRepos
//
//  Created by abdrahman on 11/04/2022.
//

import UIKit

class ReposListVC: UITableViewController {
    
    var repoListViewModel =  ReposListViewModel()
    let activityIndicator = UIActivityIndicatorView(style: .large)
    var totalItems = 0
    var currentPage = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(activityIndicator)
        activityIndicator.center = view.center
        title = repoListViewModel.title
        tableView.register(UINib(nibName: "RepoCell", bundle: nil), forCellReuseIdentifier: "RepoCell")
        loadData()
        
    }

    func loadData(){
        activityIndicator.startAnimating()
        repoListViewModel.loadRepos(currentPage)
        repoListViewModel.onUpdate = { [weak self] in
            self?.totalItems = self?.repoListViewModel.cells.count ?? 0
            self?.tableView.reloadData()
            self?.activityIndicator.stopAnimating()
        }
        
        
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return repoListViewModel.numberOfRows()
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "RepoCell", for: indexPath)
        let vm = repoListViewModel.cells[indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: "RepoCell", for: indexPath) as! RepoCell
            cell.update(with: vm)
            return cell
        //return cell
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == repoListViewModel.cells.count - 1{
            if repoListViewModel.cells.count <= totalItems {
                print("Call the next page")
                self.currentPage += 1
                loadData()
                print("currentPage is :- \(currentPage)")
            }else{
                print("repoListViewModel.cells.count < indexPath.row but repoListViewModel.cells.count > totalItems ,,, totalItems are :- \(totalItems)")
            }
            
        }
        else{
            print("repoListViewModel.cells.count > indexPath.row ,,, totalItems are :- \(totalItems)")
        }
    }
}
