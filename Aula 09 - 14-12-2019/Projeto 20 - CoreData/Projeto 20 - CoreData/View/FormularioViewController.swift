//
//  FormularioViewController.swift
//  Projeto 20 - CoreData
//
//  Created by Master Mac on 30/07/19.
//  Copyright © 2019 Aecio. All rights reserved.
//

import UIKit
import JMMaskTextField

class FormularioViewController: UtilAppDelegateViewController , UITextFieldDelegate{
    
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var foneMaskTextField: JMMaskTextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBAction func cadastrarButtonAction(_ sender: UIButton) {
        
        if(nomeTextField.text == "" ||
            foneMaskTextField.text == "" ||
            emailTextField.text == ""){
            app.utilAlerta.mensagem(titulo: "Atenção!", mensagem: "Todos os campos são obrigatórios!", view: self)
            return
        }
        app.cliente = Cliente()
        app.cliente.nome = nomeTextField.text!
        app.cliente.fone = foneMaskTextField.unmaskedText
        app.cliente.email = emailTextField.text!
        app.clienteResult = app.clienteDao.cadastrar(cliente: app.cliente)
        if(app.clienteResult.executadoComSucesso){
            app.utilAlerta.mensagem(titulo: "Sucesso!", mensagem: "Cliente cadastrado!", view: self)
        }else{
            app.utilAlerta.mensagem(titulo: "Erro!", mensagem: "\(app.clienteResult.descricaoErro)", view: self)
        }
        
    }
    
    @IBAction func buscarButtonAction(_ sender: UIButton) {
        if(nomeTextField.text == ""){
            app.utilAlerta.mensagem(titulo: "Atenção!", mensagem: "Todos os campos são obrigatórios!", view: self)
            return
        }
        app.cliente = Cliente()
        app.cliente.nome = nomeTextField.text!
        app.clienteResult = app.clienteDao.buscarPorNome(nome: app.cliente.nome)
        if(app.clienteResult.executadoComSucesso){
            app.cliente = app.clienteResult.cliente
            foneMaskTextField.text = app.cliente.fone
            emailTextField.text = app.cliente.email
        }else{
            app.utilAlerta.mensagem(titulo: "Erro!", mensagem: "Nenhum cliente encontrado!", view: self)
        }
    }
    
    @IBAction func atualizarButtonAction(_ sender: UIButton) {
        if(nomeTextField.text == "" ||
            foneMaskTextField.text == "" ||
            emailTextField.text == ""){
            app.utilAlerta.mensagem(titulo: "Atenção!", mensagem: "Todos os campos são obrigatórios!", view: self)
            return
        }
        app.cliente = Cliente()
        app.cliente.nome = nomeTextField.text!
        app.cliente.fone = foneMaskTextField.unmaskedText
        app.cliente.email = emailTextField.text!
        app.clienteResult = app.clienteDao.atualizar(cliente: app.cliente)
        if(app.clienteResult.executadoComSucesso){
            app.utilAlerta.mensagem(titulo: "Sucesso!", mensagem: "Cliente atualizado!", view: self)
        }else{
            app.utilAlerta.mensagem(titulo: "Erro!", mensagem: "\(app.clienteResult.descricaoErro)", view: self)
        }
    }
    
    @IBAction func todosButtonAction(_ sender: UIButton) {
        app.clienteResult = app.clienteDao.todos()
        if(app.clienteResult.executadoComSucesso){
            app.clientes = app.clienteResult.clientes
            let clientesViewController = ClientesViewController()
            app.window?.rootViewController = clientesViewController
            app.window?.makeKeyAndVisible()
        }else{
            app.utilAlerta.mensagem(titulo: "Atenção!", mensagem: "Nenhum cliente encontrado!", view: self)
        }
    }
    
    @IBAction func buscaAproxButtonAction(_ sender: UIButton) {
        if(nomeTextField.text == ""){
            app.utilAlerta.mensagem(titulo: "Atenção!", mensagem: "Todos os campos são obrigatórios!", view: self)
            return
        }
        app.clienteResult = app.clienteDao.buscaAproximada(chaveBusca: CORE_DATA_CLIENTE.NOME.rawValue, valor: nomeTextField.text!)
        if(app.clienteResult.executadoComSucesso){
            app.clientes = app.clienteResult.clientes
            let clientesViewController = ClientesViewController()
            app.window?.rootViewController = clientesViewController
            app.window?.makeKeyAndVisible()
        }else{
            app.utilAlerta.mensagem(titulo: "Atenção!", mensagem: "Nenhum cliente encontrado!", view: self)
        }
    }
    
    @IBAction func excluirButtonAction(_ sender: UIButton) {
        if(nomeTextField.text == ""){
            app.utilAlerta.mensagem(titulo: "Atenção!", mensagem: "Todos os campos são obrigatórios!", view: self)
            return
        }
        app.clienteResult = app.clienteDao.excluir(chaveBusca: CORE_DATA_CLIENTE.NOME.rawValue, valor: nomeTextField.text!)
        if(app.clienteResult.executadoComSucesso){
            app.utilAlerta.mensagem(titulo: "Sucesso!", mensagem: "Cliente excluído!", view: self)
        }else{
            app.utilAlerta.mensagem(titulo: "Erro!", mensagem: "Nenhum cliente encontrado!", view: self)
        }
    }
    
    @IBAction func limparFormularioButtonAction(_ sender: UIButton) {
        nomeTextField.text = ""
        foneMaskTextField.text = ""
        emailTextField.text = ""
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let tf = textField as! JMMaskTextField
        if(tf.unmaskedText.count >= 10){
            tf.maskString = "(00) 0 0000-0000"
        }else{
            tf.maskString = "(00) 0000-0000"
        }
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        foneMaskTextField.delegate = self
        // Do any additional setup after loading the view.
        nomeTextField.text = app.cliente.nome
        foneMaskTextField.text = app.cliente.fone
        emailTextField.text = app.cliente.email
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
