//
//  ClienteDao.swift
//  Projeto 20 - CoreData
//
//  Created by Master Mac on 30/07/19.
//  Copyright © 2019 Aecio. All rights reserved.
//

import UIKit
import CoreData

class ClienteDao: NSObject {
    
    func cadastrar(cliente : Cliente) -> ClienteResult {
        
        let app = UIApplication.shared.delegate as! AppDelegate
        let clienteResult = ClienteResult()
        
        // Gerenciador de banco
        let dbManager = app.persistentContainer.viewContext
        
        // Gerenciador de entidades
        let entityManager = NSEntityDescription.entity(forEntityName : CORE_DATA.CLIENTE.rawValue , in: dbManager)
        
        // Entidade selecinada
        let clienteStored = NSManagedObject(entity: entityManager! , insertInto: dbManager)
        
        // Set values
        cliente.idTimeStamp = "\(String(describing: Date().currentTimeStamp()))"
        clienteStored.setValue(cliente.idTimeStamp , forKey: CORE_DATA_CLIENTE.ID_TIME_STAMP.rawValue)
        clienteStored.setValue(cliente.nome , forKey: CORE_DATA_CLIENTE.NOME.rawValue)
        clienteStored.setValue(cliente.fone , forKey: CORE_DATA_CLIENTE.FONE.rawValue)
        clienteStored.setValue(cliente.email , forKey: CORE_DATA_CLIENTE.EMAIL.rawValue)
        
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
        
        // Gerenciador de banco
        let dbManager = app.persistentContainer.viewContext
        
        // Apontar a SQL para e entidade
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName : CORE_DATA.CLIENTE.rawValue)
        
        // Limitar a SQL
        fetchRequest.predicate = NSPredicate(format: "\(chaveBusca) =%@" , valor)
        do{
            let resp = try dbManager.fetch(fetchRequest)
            print(resp)
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
                clienteResult.descricaoErro = "Nenhum cliente encontrado para o filtro"
                clienteResult.executadoComSucesso = false
            }
        }catch let error as NSError {
            clienteResult.descricaoErro = "\(error)"
            clienteResult.executadoComSucesso = false
        }
        
        return clienteResult
        
    }
    
    func buscarPorIdTimeStamp(idTimeStamp : String) -> ClienteResult{
        return self.buscar(chaveBusca : CORE_DATA_CLIENTE.ID_TIME_STAMP.rawValue , valor : idTimeStamp)
    }
    
    func buscarPorNome(nome : String) -> ClienteResult{
        return self.buscar(chaveBusca : CORE_DATA_CLIENTE.NOME.rawValue , valor : nome)
    }
    
    func buscarPorEmail(email : String) -> ClienteResult{
        return self.buscar(chaveBusca : CORE_DATA_CLIENTE.EMAIL.rawValue , valor : email)
    }
    
    func buscarPorFone(fone : String) -> ClienteResult{
        return self.buscar(chaveBusca : CORE_DATA_CLIENTE.FONE.rawValue , valor : fone)
    }
    
    func excluir(chaveBusca : String , valor : String) -> ClienteResult {
        
        let app = UIApplication.shared.delegate as! AppDelegate
        let clienteResult = ClienteResult()
        
        // Gerenciador de banco
        let dbManager = app.persistentContainer.viewContext
        
        // Apontar a SQL para e entidade
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName : CORE_DATA.CLIENTE.rawValue)
        
        // Limitar a SQL
        fetchRequest.predicate = NSPredicate(format: "\(chaveBusca) =%@" , valor)
        do{
            let resp = try dbManager.fetch(fetchRequest)
            print(resp)
            if(resp.count > 0){
                let managedObject = resp[0]
                dbManager.delete(managedObject)
                do{
                    try dbManager.save()
                    clienteResult.executadoComSucesso = true
                }catch{
                    clienteResult.executadoComSucesso = false
                }
            }else{
                clienteResult.descricaoErro = "Nenhum cliente encontrado para o filtro"
                clienteResult.executadoComSucesso = false
            }
        }catch let error as NSError {
            clienteResult.descricaoErro = "\(error)"
            clienteResult.executadoComSucesso = false
        }
        
        return clienteResult
        
    }
    
    func atualizar(cliente : Cliente) -> ClienteResult {
        
        let app = UIApplication.shared.delegate as! AppDelegate
        let clienteResult = ClienteResult()
        
        // Gerenciador de banco
        let dbManager = app.persistentContainer.viewContext
        // Apontar a SQL para e entidade
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName : CORE_DATA.CLIENTE.rawValue)
        // Limitar a SQL
        fetchRequest.predicate = NSPredicate(format: "\(CORE_DATA_CLIENTE.NOME.rawValue) =%@" , cliente.nome)
        
        do{
            let resp = try dbManager.fetch(fetchRequest)
            print(resp)
            if(resp.count > 0){
                let managedObject = resp[0]
                managedObject.setValue(cliente.fone , forKey : CORE_DATA_CLIENTE.FONE.rawValue)
                managedObject.setValue(cliente.email , forKey : CORE_DATA_CLIENTE.EMAIL.rawValue)
                do{
                    try dbManager.save()
                    clienteResult.executadoComSucesso = true
                }catch{
                    clienteResult.executadoComSucesso = false
                }
            }
        }catch let error as NSError {
            clienteResult.descricaoErro = "\(error)"
            clienteResult.executadoComSucesso = false
        }
        
        return clienteResult
        
    }
    
    func atualizarByTimeStampId(cliente : Cliente) -> ClienteResult {
        
        let app = UIApplication.shared.delegate as! AppDelegate
        let clienteResult = ClienteResult()
        
        // Gerenciador de banco
        let dbManager = app.persistentContainer.viewContext
        // Apontar a SQL para e entidade
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName : CORE_DATA.CLIENTE.rawValue)
        // Limitar a SQL
        fetchRequest.predicate = NSPredicate(format: "\(CORE_DATA_CLIENTE.ID_TIME_STAMP.rawValue) =%@" , cliente.idTimeStamp)
        
        do{
            let resp = try dbManager.fetch(fetchRequest)
            print(resp)
            if(resp.count > 0){
                let managedObject = resp[0]
                managedObject.setValue(cliente.nome , forKey : CORE_DATA_CLIENTE.NOME.rawValue)
                managedObject.setValue(cliente.fone , forKey : CORE_DATA_CLIENTE.FONE.rawValue)
                managedObject.setValue(cliente.email , forKey : CORE_DATA_CLIENTE.EMAIL.rawValue)
                do{
                    try dbManager.save()
                    clienteResult.executadoComSucesso = true
                }catch{
                    clienteResult.executadoComSucesso = false
                }
            }
        }catch let error as NSError {
            clienteResult.descricaoErro = "\(error)"
            clienteResult.executadoComSucesso = false
        }
        
        return clienteResult
        
    }
    
    func todos() -> ClienteResult {
        
        let app = UIApplication.shared.delegate as! AppDelegate
        let clienteResult = ClienteResult()
        
        // Gerenciador de banco
        let dbManager = app.persistentContainer.viewContext
        
        // Apontar a SQL para e entidade
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName : CORE_DATA.CLIENTE.rawValue)
        
        do{
            let resp = try dbManager.fetch(fetchRequest)
            print(resp)
            if(resp.count > 0){
                for managedObject in resp {
                    clienteResult.cliente = Cliente()
                    clienteResult.cliente.idTimeStamp = managedObject.value(forKey: CORE_DATA_CLIENTE.ID_TIME_STAMP.rawValue) as! String
                    clienteResult.cliente.nome = managedObject.value(forKey: CORE_DATA_CLIENTE.NOME.rawValue) as! String
                    clienteResult.cliente.fone = managedObject.value(forKey: CORE_DATA_CLIENTE.FONE.rawValue) as! String
                    clienteResult.cliente.email = managedObject.value(forKey: CORE_DATA_CLIENTE.EMAIL.rawValue) as! String
                    clienteResult.clientes.append(clienteResult.cliente)
                    clienteResult.executadoComSucesso = true
                }
            }else{
                clienteResult.descricaoErro = "Nenhum cliente encontrado para o filtro"
                clienteResult.executadoComSucesso = false
            }
        }catch let error as NSError {
            clienteResult.descricaoErro = "\(error)"
            clienteResult.executadoComSucesso = false
        }
        
        return clienteResult
        
    }
    
    func buscaAproximada(chaveBusca : String , valor : String) -> ClienteResult {
        
        let app = UIApplication.shared.delegate as! AppDelegate
        let clienteResult = ClienteResult()
        
        // Gerenciador de banco
        let dbManager = app.persistentContainer.viewContext
        
        // Apontar a SQL para e entidade
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName : CORE_DATA.CLIENTE.rawValue)
        
        // Limitar a SQL
        fetchRequest.predicate = NSPredicate(format: "\(chaveBusca) contains[c] %@" , valor)
        do{
            let resp = try dbManager.fetch(fetchRequest)
            print(resp)
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
                clienteResult.descricaoErro = "Nenhum cliente encontrado para o filtro"
                clienteResult.executadoComSucesso = false
            }
        }catch let error as NSError {
            clienteResult.descricaoErro = "\(error)"
            clienteResult.executadoComSucesso = false
        }
        
        return clienteResult
        
    }
    
}
