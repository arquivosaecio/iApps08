//
//  ViewController.swift
//  Projeto 02 - Slider Formatter Stepper
//
//  Created by Infinite Loop Goiânia on 05/10/19.
//  Copyright © 2019 Infinite Loop Goiânia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let utilString = UtilString()
    
    @IBOutlet weak var alturaLabel: UILabel!
    @IBOutlet weak var idadeLabel: UILabel!
    @IBOutlet weak var alturaSliderOutlet: UISlider!
    @IBOutlet weak var idadeStepperOutlet: UIStepper!
    
    @IBAction func alturaSliderAction(_ sender: Any) {
        
        //alturaLabel.text = "\(alturaSliderOutlet.value)"
        alturaLabel.text = utilString.formatar(numero: alturaSliderOutlet.value, casas: 2)
        
    }
    
    @IBAction func idadeStepperAction(_ sender: Any) {
        
        //idadeLabel.text = "\(idadeStepperOutlet.value)"
        idadeLabel.text = utilString.formatar(numero: idadeStepperOutlet.value, casas: 0)
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

