//
//  TodosViewController.swift
//  Projeto 21 - WebService
//
//  Created by Master Mac on 03/08/19.
//  Copyright © 2019 Aecio. All rights reserved.
//

import UIKit

class TodosViewController: UtilAppDelegateViewController , UITableViewDataSource , UITableViewDelegate {
    
    @IBOutlet weak var contatosTableView: UITableView!
    
    @IBAction func voltarButtonAction(_ sender: UIButton) {
        let formularioViewController = FormularioViewController()
        app.window?.rootViewController = formularioViewController
        app.window?.makeKeyAndVisible()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        contatosTableView.delegate = self
        contatosTableView.dataSource = self
        let xib = UINib(nibName: "ContatoTableViewCell", bundle: nil)
        contatosTableView.register(xib, forCellReuseIdentifier: "cell")
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return app.contatos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = contatosTableView.dequeueReusableCell(withIdentifier: "cell") as! ContatoTableViewCell
        cell.idLabel.text = "\(app.contatos[indexPath.row].id)"
        cell.nomeLabel.text = app.contatos[indexPath.row].nome
        cell.foneLabel.text = app.contatos[indexPath.row].fone
        cell.emailLabel.text = app.contatos[indexPath.row].email
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        app.contato = app.contatos[indexPath.row]
        let formularioViewController = FormularioViewController()
        app.window?.rootViewController = formularioViewController
        app.window?.makeKeyAndVisible()
    }

}
