//
//  PrincipalViewController.swift
//  Projeto 09 - App Universal
//
//  Created by iApps on 23/11/19.
//  Copyright © 2019 iApps. All rights reserved.
//

import UIKit

class PrincipalViewController: UIViewController {
    
    static let xibs = ["PrinciapliPhoneView","PrincipaliPadView"]
    
    @IBOutlet weak var nomeTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
