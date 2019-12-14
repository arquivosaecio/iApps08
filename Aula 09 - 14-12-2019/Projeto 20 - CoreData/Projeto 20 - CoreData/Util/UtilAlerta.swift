//
//  UtilAlerta.swift
//  Projeto 05 - Switch AlertController
//
//  Created by Master Mac on 09/07/19.
//  Copyright © 2019 Master Mac. All rights reserved.
//

import UIKit

class UtilAlerta: NSObject {
    
    func mensagem(titulo : String , mensagem : String , view : UIViewController ){
        
        let alertController = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            print("OK")
        }
        
        alertController.addAction(okAction)
        view.present(alertController, animated: true, completion: nil)
        
    }
    
    func mensagemComTextField(titulo : String , mensagem : String , view : UIViewController ) -> String {
        
        var textoInformado = String()
        var executou = false
        
        let alertController = UIAlertController(title: titulo, message: mensagem, preferredStyle: UIAlertController.Style.alert)
        
        alertController.addTextField { (textField : UITextField!) -> Void in

        }
        
        let saveAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { alert -> Void in
            let firstTextField = alertController.textFields![0] as UITextField
            textoInformado = firstTextField.text!
            executou = true
            
        })
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: UIAlertAction.Style.default, handler: { alert -> Void in
            executou = true
        })
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        view.present(alertController, animated: true, completion: nil)
        
        while (executou == false) {
            self.wait()
        }
        
        return textoInformado
        
    }
    
    /*
     let credenciais = utilAlerta.credenciais(userOrEmail: "Email", mensagem: "", view: self)
     print("\(credenciais.usuario) \(credenciais.senha) \(credenciais.usuarioCancelou)")
    */
    func credenciais(userOrEmail : String , mensagem : String , view : UIViewController ) -> Credencial {
        
        let credencial = Credencial()
        var executou = false
        
        let alertController = UIAlertController(title: "Credenciais", message: mensagem, preferredStyle: UIAlertController.Style.alert)
        
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = userOrEmail
        }
        
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Senha"
            textField.isSecureTextEntry = true
        }
        
        let saveAction = UIAlertAction(title: "Login", style: UIAlertAction.Style.default, handler: { alert -> Void in
            let firstTextField = alertController.textFields![0] as UITextField
            credencial.usuario = firstTextField.text!
            let secondTextField = alertController.textFields![1] as UITextField
            credencial.senha = secondTextField.text!
            executou = true
            
        })
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: UIAlertAction.Style.default, handler: { alert -> Void in
            credencial.usuarioCancelou = true
            executou = true
        })
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        view.present(alertController, animated: true, completion: nil)
        
        while (executou == false) {
            self.wait()
        }
        
        return credencial
        
    }
    
    /*
 
     let buttons = ["sim","não","talvez"]
     let indexButtonPressed = utilAlerta.multiMensagem(titulo: "Multi", mensagem: "Mensagem", buttons: buttons, view: self)
     print(indexButtonPressed)
     
    */
    
    func multiMensagem(titulo : String , mensagem : String , buttons: [String], view : UIViewController ) -> Int {
        
        var indexButtonPressed = 0
        var executou = false
        
        let alertController = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
    
        for button in buttons {
            
            let buttonAction = UIAlertAction(title: button, style: .default) { (action) in
                print(button)
                let index = buttons.firstIndex(of: button)
                indexButtonPressed = index!
                executou = true
            }
            
            alertController.addAction(buttonAction)
        }
        
        view.present(alertController, animated: true, completion: nil)
        
        while (executou == false) {
            self.wait()
        }
        
        return indexButtonPressed
        
    }
    
    func wait(){
        
        RunLoop.current.run(mode:.default, before: NSDate(timeIntervalSinceNow: 1) as Date)
        
    }

}

class Credencial : NSObject {
    
    var usuario = ""
    var senha = ""
    var usuarioCancelou = false
    
}
