//
//  ContatoDao.swift
//  Projeto 21 - WebService
//
//  Created by Master Mac on 02/08/19.
//  Copyright © 2019 Aecio. All rights reserved.
//

import UIKit

class ContatoDao: NSObject {
    
    func inserir(contato : Contato) -> ContatoResult {
        
        let contatoResult = ContatoResult()
        let conexao = Conexao()
        conexao.setRota(protocolo: CONEXAO.PROTOCOLO.rawValue, ip: CONEXAO.IP.rawValue, porta: CONEXAO.PORTA.rawValue, arquivo: ROTA.CONTATO_INSERIR.rawValue)
        let parametros = ["nome","fone","email"]
        let valores = [contato.nome,contato.fone,contato.email]
        conexao.setParametros(chaves: parametros, valores: valores)
        let url = conexao.getUrlRota()
        let resultNSData = NSData(contentsOf: url as URL) // executou
        if(resultNSData == nil){
            contatoResult.sucessoOperacao = false
            contatoResult.descricaoException = "Sem Conexão"
        }else{
            let resultString = NSString(data: resultNSData! as Data, encoding: String.Encoding.utf8.rawValue)
            if((resultString?.contains("Sucesso")) != nil){
                contatoResult.sucessoOperacao = true
                contatoResult.descricaoException = (resultString as String?)!
            }else{
                contatoResult.sucessoOperacao = false
                contatoResult.descricaoException = (resultString as String?)!
            }
        }
        return contatoResult
        
    }
    
    func atualizar(contato : Contato) -> ContatoResult {
        
        let contatoResult = ContatoResult()
        let conexao = Conexao()
        conexao.setRota(protocolo: CONEXAO.PROTOCOLO.rawValue, ip: CONEXAO.IP.rawValue, porta: CONEXAO.PORTA.rawValue, arquivo: ROTA.CONTATO_ATUALIZAR.rawValue)
        let parametros = ["nome","fone","email","id"]
        let valores = [contato.nome,contato.fone,contato.email,"\(contato.id)"]
        conexao.setParametros(chaves: parametros, valores: valores)
        let url = conexao.getUrlRota()
        let resultNSData = NSData(contentsOf: url as URL) // executou
        if(resultNSData == nil){
            contatoResult.sucessoOperacao = false
            contatoResult.descricaoException = "Sem Conexão"
        }else{
            let resultString = NSString(data: resultNSData! as Data, encoding: String.Encoding.utf8.rawValue)
            if((resultString?.contains("Sucesso")) != nil){
                contatoResult.sucessoOperacao = true
                contatoResult.descricaoException = (resultString as String?)!
            }else{
                contatoResult.sucessoOperacao = false
                contatoResult.descricaoException = (resultString as String?)!
            }
        }
        return contatoResult
        
    }
    
    func buscar(contato : Contato) -> ContatoResult {
        
        var jsonArray = NSArray()
        let contatoResult = ContatoResult()
        let conexao = Conexao()
        conexao.setRota(protocolo: CONEXAO.PROTOCOLO.rawValue, ip: CONEXAO.IP.rawValue, porta: CONEXAO.PORTA.rawValue, arquivo: ROTA.CONTATO_BUSCAR.rawValue)
        let parametros = ["id"]
        let valores = ["\(contato.id)"]
        conexao.setParametros(chaves: parametros, valores: valores)
        let url = conexao.getUrlRota()
        let resultNSData = NSData(contentsOf: url as URL) // executou
        if(resultNSData == nil){
            contatoResult.sucessoOperacao = false
            contatoResult.descricaoException = "Sem Conexão"
        }else{
            do{
                try jsonArray = JSONSerialization.jsonObject(with: resultNSData! as Data, options: .allowFragments) as! NSArray
                if(jsonArray.count > 0){
                    let json = jsonArray[0] as! NSDictionary
                    if(json["id"] != nil){
                        contatoResult.contato.id = Int(json["id"] as! String)!
                    }
                    if(json["nome"] != nil){
                        contatoResult.contato.nome = json["nome"] as! String
                    }
                    if(json["fone"] != nil){
                        contatoResult.contato.fone = json["fone"] as! String
                    }
                    if(json["email"] != nil){
                        contatoResult.contato.email = json["email"] as! String
                    }
                    contatoResult.sucessoOperacao = true
                }else{
                    contatoResult.sucessoOperacao = false
                    contatoResult.descricaoException = "Nenhum Contato Encontrado"
                }
            }catch{
                contatoResult.sucessoOperacao = false
                contatoResult.descricaoException = "Sem Conexão"
            }
        }
        return contatoResult
        
    }
    
    func todos() -> ContatoResult {
        var jsonArray = NSArray()
        let contatoResult = ContatoResult()
        let conexao = Conexao()
        conexao.setRota(protocolo: CONEXAO.PROTOCOLO.rawValue, ip: CONEXAO.IP.rawValue, porta: CONEXAO.PORTA.rawValue, arquivo: ROTA.CONTATO_TODOS.rawValue)
        let parametros = [""]
        let valores = [""]
        conexao.setParametros(chaves: parametros, valores: valores)
        let url = conexao.getUrlRota()
        let resultNSData = NSData(contentsOf: url as URL) // executou
        if(resultNSData == nil){
            contatoResult.sucessoOperacao = false
            contatoResult.descricaoException = "Sem Conexão"
        }else{
            do{
                try jsonArray = JSONSerialization.jsonObject(with: resultNSData! as Data, options: .allowFragments) as! NSArray
                if(jsonArray.count > 0){
                    for jsonNode in jsonArray {
                        contatoResult.contato = Contato()
                        let json = jsonNode as! NSDictionary
                        if(json["id"] != nil){
                            contatoResult.contato.id = Int(json["id"] as! String)!
                        }
                        if(json["nome"] != nil){
                            contatoResult.contato.nome = json["nome"] as! String
                        }
                        if(json["fone"] != nil){
                            contatoResult.contato.fone = json["fone"] as! String
                        }
                        if(json["email"] != nil){
                            contatoResult.contato.email = json["email"] as! String
                        }
                        contatoResult.contatos.append(contatoResult.contato)
                    }
                    contatoResult.sucessoOperacao = true
                }else{
                    contatoResult.sucessoOperacao = false
                    contatoResult.descricaoException = "Nenhum Contato Encontrado"
                }
            }catch{
                contatoResult.sucessoOperacao = false
                contatoResult.descricaoException = "Sem Conexão"
            }
        }
        return contatoResult
    }
    
    func excluir(contato : Contato) -> ContatoResult {
        
        let contatoResult = ContatoResult()
        let conexao = Conexao()
        conexao.setRota(protocolo: CONEXAO.PROTOCOLO.rawValue, ip: CONEXAO.IP.rawValue, porta: CONEXAO.PORTA.rawValue, arquivo: ROTA.CONTATO_EXCLUIR.rawValue)
        let parametros = ["id"]
        let valores = ["\(contato.id)"]
        conexao.setParametros(chaves: parametros, valores: valores)
        let url = conexao.getUrlRota()
        let resultNSData = NSData(contentsOf: url as URL) // executou
        if(resultNSData == nil){
            contatoResult.sucessoOperacao = false
            contatoResult.descricaoException = "Sem Conexão"
        }else{
            let resultString = NSString(data: resultNSData! as Data, encoding: String.Encoding.utf8.rawValue)
            if((resultString?.contains("Sucesso")) != nil){
                contatoResult.sucessoOperacao = true
                contatoResult.descricaoException = (resultString as String?)!
            }else{
                contatoResult.sucessoOperacao = false
                contatoResult.descricaoException = (resultString as String?)!
            }
        }
        return contatoResult
        
    }

}
