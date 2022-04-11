//
//  AppCoordinator.swift
//  StarredRepos
//
//  Created by abdrahman on 11/04/2022.
//

import UIKit

protocol Coordinator: class {
    var childCoordinators: [Coordinator] {get}
    func start()
    func childDidFinish(_ childCoordinator: Coordinator)
}

extension Coordinator{
    func childDidFinish(_ childCoordinator: Coordinator) {}
}

class AppCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []

    var window: UIWindow
    init(_ window: UIWindow) {
        self.window = window
    }
    
    func start(){
        let nav = UINavigationController()
        let eventListCoordinator = ReposListCoordinator(nav: nav)
        eventListCoordinator.start()
        window.rootViewController = nav
        window.makeKeyAndVisible()
    }
}
