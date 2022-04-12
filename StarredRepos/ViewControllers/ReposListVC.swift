//
//  ReposListVC.swift
//  StarredRepos
//
//  Created by abdrahman on 11/04/2022.
//

import UIKit

class ReposListVC: UITableViewController {
    
    var viewModel =  ReposListViewModel()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "RepoCell", bundle: nil), forCellReuseIdentifier: "RepoCell")
        
        viewModel.onUpdate = { [weak self] in
            self?.tableView.reloadData()
        }
        
        viewModel.loadRepos()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel.numberOfRows()
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "RepoCell", for: indexPath)

//        cell.textLabel?.text = "\(indexPath.row)"
//        cell.textLabel?.textAlignment = .center
        switch  viewModel.cell(at: indexPath) {
            case .repo(let repoCellViewModel):
            let cell = tableView.dequeueReusableCell(withIdentifier: "RepoCell", for: indexPath) as! RepoCell
                cell.update(with: repoCellViewModel)
                return cell
        }
        
        //return cell
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
}
