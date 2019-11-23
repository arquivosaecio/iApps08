//
//  UtilAppDelegateViewController.swift
//  Projeto 06 - AppDelegate
//
//  Created by iApps on 09/11/19.
//  Copyright © 2019 iApps. All rights reserved.
//

import UIKit

class UtilAppDelegateViewController: UIViewController {
    
    let app = UIApplication.shared.delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
