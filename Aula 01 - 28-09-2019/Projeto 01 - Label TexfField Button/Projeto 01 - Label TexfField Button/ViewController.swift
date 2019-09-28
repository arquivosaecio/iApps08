//
//  ViewController.swift
//  Projeto 01 - Label TexfField Button
//
//  Created by Infinite Loop Goiânia on 28/09/19.
//  Copyright © 2019 Infinite Loop Goiânia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var alturaTextField: UITextField!
    @IBOutlet weak var resultadoLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        resultadoLabel.text = ""
    }
    
    @IBAction func lerDadosButtonAction(_ sender: Any) {
        resultadoLabel.text = "Nome: " + nomeTextField.text! + " Altura: " + alturaTextField.text!
    }

}

