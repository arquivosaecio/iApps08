//
//  UtilString.swift
//  Projeto 02 - Slider Formatter Stepper
//
//  Created by Master Mac on 09/07/19.
//  Copyright © 2019 Aecio. All rights reserved.
//

import UIKit

class UtilString: NSObject {

    /****************************************************************
     * Formatar um numero Double para String com N casas decimais                               **
     * Autor : Aécio Marques                                                                                                 **
     * Data Criação: 09/07/2019                                                                                            **
     * Data Última edição: 09/07/2019                              **
     ****************************************************************
     
     @param numero : Double
     @param casas : Int
     
     @return numeroFormatado : String
     */
    func formatar(numero : Double , casas : Int) -> String {
        let formato = "%.\(casas)f" as NSString
        let numeroFormatado = NSString(format: formato, numero) as String
        return numeroFormatado
    }
    
    /****************************************************************
     * Formatar um numero Float para String com N casas decimais                                   **
     * Autor : Aécio Marques                                                                                                  **
     * Data Criação: 09/07/2019                                                                                            **
     * Data Última edição: 09/07/2019                              **
     ****************************************************************
     
     @param numero : Double
     @param casas : Int
     
     @return numeroFormatado : String
     */
    func formatar(numero : Float , casas : Int) -> String {
        let num = Double(numero)
        return self.formatar(numero: num, casas: casas)
    }
    
    /****************************************************************
     * Formatar data conforme especificado em parâmetro                                                   **
     * Autor : Aécio Marques                                                                                                  **
     * Data Criação: 09/07/2019                                                                                            **
     * Data Última edição: 09/07/2019                              **
     ****************************************************************
     
     @param data : Date
     @param formato : String
     
     @return dataFormatada : String
     */
    func formatarData(data : Date , formato : String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formato
        return dateFormatter.string(from: data)
    }
    
    /****************************************************************
     * Formatar data no formato do Brasil                                                                             **
     * Autor : Aécio Marques                                                                                                  **
     * Data Criação: 09/07/2019                                                                                            **
     * Data Última edição: 09/07/2019                              **
     ****************************************************************
     
     @param data : Date
     @param formato : String
     
     @return dataFormatada : String
     */
    func formatarDataBrasil(data : Date) -> String {
        let formato = "dd/MM/yyyy"
        return self.formatarData(data: data, formato: formato)
    }
    
    func substituirCaracter(strInput : String , encontrar : String , substituir : String) -> String {
        var str = strInput
        while let range : Range<String.Index> = str.range(of: encontrar){
            str.replaceSubrange(range, with: substituir)
        }
        return str
    }
    
    func trocarVirgulaPorPonto(strInput : String) -> String {
        return self.substituirCaracter(strInput: strInput, encontrar: ",", substituir: ".")
    }
    
    func formatarURL(urlInput : String) -> String {
        var url = self.substituirCaracter(strInput: urlInput, encontrar: " ", substituir: "%20")
        url = self.substituirCaracter(strInput: url, encontrar: "/n", substituir: "%0A")
        print(url)
        return url
    }
    
}
