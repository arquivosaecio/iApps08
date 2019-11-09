//
//  AppDelegate.swift
//  Projeto 06 - AppDelegate
//
//  Created by iApps on 26/10/19.
//  Copyright © 2019 iApps. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window : UIWindow?
    
    var aluno = Aluno()
    var alunoService = AlunoService()
    
    let utilAlerta = UtilAlerta()
    let utilString = UtilString()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let principalViewController = PrincipalViewController()
        window?.rootViewController = principalViewController
        window?.makeKeyAndVisible()
        return true
    }



}

