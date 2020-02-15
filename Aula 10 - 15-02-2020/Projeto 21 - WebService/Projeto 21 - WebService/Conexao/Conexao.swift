//
//  Conexao.swift
//  Projeto 21 - WebService
//
//  Created by Master Mac on 02/08/19.
//  Copyright © 2019 Aecio. All rights reserved.
//

import UIKit

class Conexao: NSObject {
    
    var rota : String = ""
    var parametros : String = ""
    
    func setRota(protocolo : String , ip : String , porta : String , arquivo : String){
        rota = "\(protocolo)\(ip)\(porta)\(arquivo)"
    }
    
    func setParametros(chaves : Array<String> , valores : Array<String>){
        var str : String = "?"
        var i : Int = 0
        for chave in chaves{
            str = str + chave + "=" + valores[i]
            i+=1
            if(i < chaves.count){
                str = str + "&"
            }
        }
        parametros = str
    }
    
    func getUrlRota() -> NSURL {
        
        var url : String = rota + parametros
        let utilString = UtilString()
        url = utilString.formatarURL(urlInput: url)
        return NSURL(string: url)!
        
    }

}
