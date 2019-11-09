//
//  ResultadoViewController.swift
//  Projeto 06 - AppDelegate
//
//  Created by iApps on 09/11/19.
//  Copyright © 2019 iApps. All rights reserved.
//

import UIKit

class ResultadoViewController: UtilAppDelegateViewController {
    
    @IBOutlet weak var resultadoLabel: UILabel!
    
    @IBAction func voltarButtonAction(_ sender: UIButton) {
        
        let principalViewController = PrincipalViewController()
        app.window?.rootViewController = principalViewController
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        resultadoLabel.text = app.utilString.formatar(numero: app.aluno.media, casas: 2)
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
