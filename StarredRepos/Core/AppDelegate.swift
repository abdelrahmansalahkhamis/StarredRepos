//
//  AppDelegate.swift
//  StarredRepos
//
//  Created by abdrahman on 11/04/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow()
        self.window = window
        self.appCoordinator = AppCoordinator(window)
        appCoordinator?.start()
        return true
    }
}

