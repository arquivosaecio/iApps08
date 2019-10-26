//
//  UtilString.swift
//  Projeto 03 - PickerView DatePicker Formatter
//
//  Created by iApps on 19/10/19.
//  Copyright © 2019 iApps. All rights reserved.
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
    
    /*
     Formatar data na opção que eu escolher
     Autor: Aécio
     Data Criação: 19/10/2019
     Data última edição: 19/10/2019
     */
    func formatarData(data : Date , formato : String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formato
        return dateFormatter.string(from: data)
    }
    
    func formatarDataBrasil(data : Date ) -> String{
        let formato = "dd/MM/yyyy"
        return formatarData(data: data, formato: formato)
    }
    

}
