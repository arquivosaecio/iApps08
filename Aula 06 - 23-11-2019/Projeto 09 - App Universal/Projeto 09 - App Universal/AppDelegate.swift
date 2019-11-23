//
//  AppDelegate.swift
//  Projeto 09 - App Universal
//
//  Created by iApps on 23/11/19.
//  Copyright © 2019 iApps. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let utilAparelho = UtilAparelho()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let principalViewController =
            PrincipalViewController(nibName: PrincipalViewController.xibs[utilAparelho.deviceCode], bundle: nil)
        window?.rootViewController = principalViewController
        window?.makeKeyAndVisible()
        return true
    }




}

