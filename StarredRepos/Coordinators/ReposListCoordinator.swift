//
//  ReposListCoordinator.swift
//  StarredRepos
//
//  Created by abdrahman on 11/04/2022.
//

import UIKit

class ReposListCoordinator: Coordinator{
    var childCoordinators: [Coordinator] = []
    private let nav: UINavigationController
    
    init(nav: UINavigationController) {
        self.nav = nav
    }
    
    func start() {
        let repoListVC: ReposListVC = .instantiate()
        nav.setViewControllers([repoListVC], animated: false)
        nav.navigationBar.prefersLargeTitles = true
    }
}
