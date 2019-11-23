//
//  ViewController.swift
//  Projeto 07 - ScrollView TouchesBegan
//
//  Created by iApps on 23/11/19.
//  Copyright © 2019 iApps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }


}

