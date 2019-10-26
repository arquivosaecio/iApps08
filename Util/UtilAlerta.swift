//
//  UtilAlerta.swift
//  Projeto 05 - Switch AlertController
//
//  Created by iApps on 26/10/19.
//  Copyright © 2019 iApps. All rights reserved.
//

import UIKit

class UtilAlerta: NSObject {
    
    func mensagem(titulo : String , mensagem : String , view : UIViewController){
        
        // Criando o titulo e mensagem de corpo da janela
        let alertController = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        // Criando o botão da janela
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            // aqui ficaria o meu código se eu quisesse fazer alguma ao clicar no botão ok...
        }
        // Adicionando o botão a janela
        alertController.addAction(okAction)
        // Mostrando a janela na tela
        view.present(alertController, animated: true, completion: nil)
        
    }
    

}
