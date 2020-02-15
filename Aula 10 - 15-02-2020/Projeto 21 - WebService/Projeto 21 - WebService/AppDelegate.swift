//
//  AppDelegate.swift
//  Projeto 21 - WebService
//
//  Created by Master Mac on 15/02/20.
//  Copyright © 2020 Master Mac. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var contato = Contato()
    var contatoResult = ContatoResult()
    var contatos : Array<Contato> = []
    var contatoDao = ContatoDao()
    let utilAlerta = UtilAlerta()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let formularioViewController = FormularioViewController()
        window?.rootViewController = formularioViewController
        window?.makeKeyAndVisible()
        return true
    }




}

