//
//  AppDelegate.swift
//  MoviesApp
//
//  Created by Ramesh on 14/10/19.
//  Copyright © 2019 Ramesh. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var coordinator: MovieCoordinator?
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let navigationController = UINavigationController()
        coordinator = MovieCoordinator(navigationController: navigationController)
        coordinator?.start()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }

}

