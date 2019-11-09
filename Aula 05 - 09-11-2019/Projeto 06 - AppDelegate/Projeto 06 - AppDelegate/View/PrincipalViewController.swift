//
//  PrincipalViewController.swift
//  Projeto 06 - AppDelegate
//
//  Created by iApps on 26/10/19.
//  Copyright © 2019 iApps. All rights reserved.
//

import UIKit

class PrincipalViewController: UtilAppDelegateViewController {
    
    
    @IBOutlet weak var p1TextField: UITextField!
    @IBOutlet weak var p2TextField: UITextField!
    
    @IBAction func calcularMediaButtonAction(_ sender: UIButton) {
        
        if(p1TextField.text == "" || p2TextField.text == ""){
            app.utilAlerta.mensagem(titulo: "Atenção!", mensagem: "Todos os campos são obrigatórios!", view: self)
        }else{
            p1TextField.text! = app.utilString.trocarVirgulaPorPonto(strInput: p1TextField.text!)
            p2TextField.text! = app.utilString.trocarVirgulaPorPonto(strInput: p2TextField.text!)
            
            app.aluno.p1 = Double(p1TextField.text!)!
            app.aluno.p2 = Double(p2TextField.text!)!
            
            app.aluno = app.alunoService.getMedia(aluno: app.aluno)
            
            let resultadoViewController = ResultadoViewController()
            app.window?.rootViewController = resultadoViewController
            
        }
        
    }
    
    
    
    

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
