//
//  ViewController.swift
//  Projeto 05 - Switch AlertController
//
//  Created by iApps on 26/10/19.
//  Copyright © 2019 iApps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let utilAlerta = UtilAlerta()
    
    @IBOutlet weak var taxaServicoLabel: UILabel!
    @IBOutlet weak var taxaServicoSwitchOutlet: UISwitch!
    
    @IBAction func taxaServicoSwitchAction(_ sender: Any) {
        
        if(taxaServicoSwitchOutlet.isOn){ // chavinha ligada...
            taxaServicoLabel.text = "Pagar 10 %"
        }else{
            taxaServicoLabel.text = "Não Pagar 10 %"
        }
    }
    
    @IBAction func fecharContaButtonAction(_ sender: Any) {
        
        if(taxaServicoSwitchOutlet.isOn){ // chavinha ligada...
            utilAlerta.mensagem(titulo: "Valeu", mensagem: "Patrão", view: self)
        }else{
            utilAlerta.mensagem(titulo: "Obrigado", mensagem: "Por nada...", view: self)
        }
        
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
}

