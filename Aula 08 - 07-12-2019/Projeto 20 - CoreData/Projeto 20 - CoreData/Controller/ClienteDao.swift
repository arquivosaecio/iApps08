//
//  ClienteDao.swift
//  Projeto 20 - CoreData
//
//  Created by iApps on 07/12/19.
//  Copyright © 2019 iApps. All rights reserved.
//

import UIKit
import CoreData

class ClienteDao: NSObject {
    
    func cadastrar(cliente : Cliente) -> ClienteResult {
        
        let app = UIApplication.shared.delegate as! AppDelegate
        let clienteResult = ClienteResult()
        
        //gerenciador de banco de dados
        let dbManager = app.persistentContainer.viewContext
        
        //gerenciador de entidades (tabelas)
        let entityManager = NSEntityDescription.entity(forEntityName: CORE_DATA.CLIENTE.rawValue, in: dbManager)!
        
        // Tabela selecionada (entidade)
        let clienteStored = NSManagedObject(entity: entityManager, insertInto: dbManager)
        
        // gravar o valores dos campos no objeto
        clienteStored.setValue(cliente.nome, forKey: CORE_DATA_CLIENTE.NOME.rawValue)
        clienteStored.setValue(cliente.fone, forKey: CORE_DATA_CLIENTE.FONE.rawValue)
        clienteStored.setValue(cliente.email, forKey: CORE_DATA_CLIENTE.EMAIL.rawValue)
        
        do{
            try dbManager.save()
            clienteResult.executadoComSucesso = true
        }catch let error as NSError {
            clienteResult.descricaoErro = "\(error)"
            clienteResult.executadoComSucesso = false
        }
        
        return clienteResult
        
    }
    
    func buscar(chaveBusca : String , valor : String) -> ClienteResult {
        
        let app = UIApplication.shared.delegate as! AppDelegate
        let clienteResult = ClienteResult()
        
        //gerenciador de banco de dados
        let dbManager = app.persistentContainer.viewContext
        
        // Apotar a SQL para a entidade
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: CORE_DATA.CLIENTE.rawValue)
        
        // definir os critérios de busca       // por qual coluna filtrar
        fetchRequest.predicate = NSPredicate(format: "\(chaveBusca) =%@", valor)
        do{
            let resp = try dbManager.fetch(fetchRequest)
            if(resp.count > 0){
                for managedObject in resp {
                    clienteResult.cliente = Cliente()
                    clienteResult.cliente.nome = managedObject.value(forKey: CORE_DATA_CLIENTE.NOME.rawValue) as! String
                    clienteResult.cliente.fone = managedObject.value(forKey: CORE_DATA_CLIENTE.FONE.rawValue) as! String
                    clienteResult.cliente.email = managedObject.value(forKey: CORE_DATA_CLIENTE.EMAIL.rawValue) as! String
                    clienteResult.clientes.append(clienteResult.cliente)
                    clienteResult.executadoComSucesso = true
                }
            }else{
                clienteResult.descricaoErro = "Nenhum registro encontrado"
                clienteResult.executadoComSucesso = false
            }
        }catch let error as NSError {
            clienteResult.descricaoErro = "\(error)"
            clienteResult.executadoComSucesso = false
        }
        return clienteResult
        
    }
    
    func buscarPorNome(nome : String) -> ClienteResult {
        return self.buscar(chaveBusca: CORE_DATA_CLIENTE.NOME.rawValue, valor: nome)
    }
    
    func buscarPorFone(nome : String) -> ClienteResult {
        return self.buscar(chaveBusca: CORE_DATA_CLIENTE.FONE.rawValue, valor: nome)
    }
    
    func buscarPorEmail(nome : String) -> ClienteResult {
        return self.buscar(chaveBusca: CORE_DATA_CLIENTE.EMAIL.rawValue, valor: nome)
    }

}
