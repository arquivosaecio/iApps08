//
//  FormularioViewController.swift
//  Projeto 21 - WebService
//
//  Created by Master Mac on 02/08/19.
//  Copyright © 2019 Aecio. All rights reserved.
//

import UIKit

class FormularioViewController: UtilAppDelegateViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var foneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBAction func inserirButtonAction(_ sender: UIButton) {
        
        if(nomeTextField.text == "" || foneTextField.text == "" || emailTextField.text == ""){
            app.utilAlerta.mensagem(titulo: "Erro", mensagem: "Campos vazios", view: self)
        }else{
            app.contato.nome = nomeTextField.text!
            app.contato.fone = foneTextField.text!
            app.contato.email = emailTextField.text!
            app.contatoResult =  app.contatoDao.inserir(contato: app.contato)
            if(app.contatoResult.sucessoOperacao){
                app.utilAlerta.mensagem(titulo: "Sucesso", mensagem: "Contato cadastrado", view: self)
            }else{
                app.utilAlerta.mensagem(titulo: "Erro", mensagem: app.contatoResult.descricaoException, view: self)
            }
        }
        
    }
    
    @IBAction func atualizarButtonAction(_ sender: UIButton) {
        
        if(idTextField.text == "" || nomeTextField.text == "" || foneTextField.text == "" || emailTextField.text == ""){
            app.utilAlerta.mensagem(titulo: "Erro", mensagem: "Campos vazios", view: self)
        }else{
            app.contato.id = Int(idTextField.text!)!
            app.contato.nome = nomeTextField.text!
            app.contato.fone = foneTextField.text!
            app.contato.email = emailTextField.text!
            app.contatoResult =  app.contatoDao.atualizar(contato: app.contato)
            if(app.contatoResult.sucessoOperacao){
                app.utilAlerta.mensagem(titulo: "Sucesso", mensagem: "Contato atualizado", view: self)
            }else{
                app.utilAlerta.mensagem(titulo: "Erro", mensagem: app.contatoResult.descricaoException, view: self)
            }
        }
        
    }
    
    @IBAction func excluirButtonAction(_ sender: UIButton) {
        
        if(idTextField.text == ""){
            app.utilAlerta.mensagem(titulo: "Erro", mensagem: "ID é obrigatório", view: self)
        }else{
            app.contato.id = Int(idTextField.text!)!
            app.contatoResult =  app.contatoDao.excluir(contato: app.contato)
            if(app.contatoResult.sucessoOperacao){
                app.utilAlerta.mensagem(titulo: "Sucesso", mensagem: "Contato excluído", view: self)
                self.limparForm()
            }else{
                app.utilAlerta.mensagem(titulo: "Erro", mensagem: app.contatoResult.descricaoException, view: self)
            }
        }
        
    }
    
    @IBAction func buscarButtonAction(_ sender: UIButton) {
        
        if(idTextField.text == ""){
            app.utilAlerta.mensagem(titulo: "Erro", mensagem: "ID é obrigatório", view: self)
        }else{
            app.contato.id = Int(idTextField.text!)!
            app.contatoResult =  app.contatoDao.buscar(contato: app.contato)
            if(app.contatoResult.sucessoOperacao){
                app.contato = app.contatoResult.contato
                nomeTextField.text = app.contato.nome
                foneTextField.text = app.contato.fone
                emailTextField.text = app.contato.email
            }else{
                app.utilAlerta.mensagem(titulo: "Erro", mensagem: app.contatoResult.descricaoException, view: self)
            }
        }
        
    }
    
    @IBAction func todosButtonAction(_ sender: UIButton) {
        app.contatoResult = app.contatoDao.todos()
        if(app.contatoResult.sucessoOperacao){
            app.contatos = app.contatoResult.contatos
            let todosViewController = TodosViewController()
            app.window?.rootViewController = todosViewController
            app.window?.makeKeyAndVisible()
        }else{
            app.utilAlerta.mensagem(titulo: "Erro", mensagem: app.contatoResult.descricaoException, view: self)
        }
    }
    
    @IBAction func limparFormButtonAction(_ sender: UIButton) {
        self.limparForm()
    }
    
    func limparForm(){
        idTextField.text = ""
        nomeTextField.text = ""
        foneTextField.text = ""
        emailTextField.text = ""
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if(app.contato.id == 0){
            idTextField.text = ""
        }else{
            idTextField.text = "\(app.contato.id)"
        }
        nomeTextField.text = app.contato.nome
        foneTextField.text = app.contato.fone
        emailTextField.text = app.contato.email
    }


}
