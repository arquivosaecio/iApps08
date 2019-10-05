//
//  UtilString.swift
//  Projeto 02 - Slider Formatter Stepper
//
//  Created by Infinite Loop Goiânia on 05/10/19.
//  Copyright © 2019 Infinite Loop Goiânia. All rights reserved.
//

import UIKit

class UtilString: NSObject {
    
    /*
     Formata qualquer numero para N casas decimais
     Autor: Aécio
     Data Criação: 05/10/2019
     Data última edição: 05/10/2019
    */
    func formatar(numero : Double , casas : Int) -> String {
        let formato = "%.\(casas)f" as NSString
        return NSString(format: formato , numero) as String
    }
    
    func formatar(numero : Float , casas : Int) -> String {
        let num = Double(numero)
        return formatar(numero: num, casas: casas)
    }

}
