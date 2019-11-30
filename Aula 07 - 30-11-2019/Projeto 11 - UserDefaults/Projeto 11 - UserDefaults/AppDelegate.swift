//
//  AppDelegate.swift
//  Projeto 11 - UserDefaults
//
//  Created by iApps on 30/11/19.
//  Copyright © 2019 iApps. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let utilUserDefaults = UtilUserDefaults()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let principalViewController = PrincipalViewController()
        window?.rootViewController = principalViewController
        window?.makeKeyAndVisible()
        return true
    }



}

