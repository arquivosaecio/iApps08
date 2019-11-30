//
//  PrincipalViewController.swift
//  Projeto 11 - UserDefaults
//
//  Created by iApps on 30/11/19.
//  Copyright © 2019 iApps. All rights reserved.
//

import UIKit

class PrincipalViewController: UtilAppDelegateViewController {
    
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var pesoTextField: UITextField!
    @IBOutlet weak var idadeTextField: UITextField!
    
    
    @IBAction func saveButtonAction(_ sender: UIButton) {
        
        let nome = nomeTextField.text!
        let idade = Int(idadeTextField.text!)
        let peso = Double(pesoTextField.text!)
        print(app.utilUserDefaults.saveOrUpdate(key: USER_DEFAULTS.NOME_KEY.rawValue, value: nome as AnyObject))
        print(app.utilUserDefaults.saveOrUpdate(key: USER_DEFAULTS.IDADE_KEY.rawValue, value: idade as AnyObject))
        print(app.utilUserDefaults.saveOrUpdate(key: USER_DEFAULTS.PESO_KEY.rawValue, value: peso as AnyObject))
        
    }
    
    @IBAction func loadButtonAction(_ sender: UIButton) {
        
        let nome = app.utilUserDefaults.load(key: USER_DEFAULTS.NOME_KEY.rawValue, defaultValue: DEFAULT_VALUE.NOME)
        let idade = app.utilUserDefaults.load(key: USER_DEFAULTS.IDADE_KEY.rawValue, defaultValue: DEFAULT_VALUE.IDADE)
        let peso = app.utilUserDefaults.load(key: USER_DEFAULTS.PESO_KEY.rawValue, defaultValue: DEFAULT_VALUE.PESO)
        nomeTextField.text = nome
        pesoTextField.text = String(peso)
        idadeTextField.text = String(idade)
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
