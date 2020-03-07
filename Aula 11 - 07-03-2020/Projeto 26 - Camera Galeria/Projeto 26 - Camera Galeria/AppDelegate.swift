//
//  AppDelegate.swift
//  Projeto 26 - Camera Galeria
//
//  Created by Master Mac on 09/08/19.
//  Copyright © 2019 Aecio. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    let utilAlerta = UtilAlerta()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let getImagesViewController = GetImagesViewController()
        window?.rootViewController = getImagesViewController
        window?.makeKeyAndVisible()
        return true
    }
    
    
    
    
}

