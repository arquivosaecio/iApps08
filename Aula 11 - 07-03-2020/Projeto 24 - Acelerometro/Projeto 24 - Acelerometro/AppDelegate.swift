//
//  AppDelegate.swift
//  Projeto 24 - Acelerometro
//
//  Created by Master Mac on 09/08/19.
//  Copyright © 2019 Aecio. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let leituraAcelerometroViewController = LeituraAcelerometroViewController()
        window?.rootViewController = leituraAcelerometroViewController
        window?.makeKeyAndVisible()
        return true
    }


}

