//
//  ClientesViewController.swift
//  Projeto 20 - CoreData
//
//  Created by Master Mac on 31/07/19.
//  Copyright © 2019 Aecio. All rights reserved.
//

import UIKit

class ClientesViewController: UtilAppDelegateViewController , UITableViewDelegate , UITableViewDataSource {
    
    @IBOutlet weak var clientesTableView: UITableView!
    
    @IBAction func voltarButtonAction(_ sender: UIButton) {
        let formularioViewController = FormularioViewController()
        app.window?.rootViewController = formularioViewController
        app.window?.makeKeyAndVisible()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return app.clientes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = clientesTableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = app.clientes[indexPath.row].nome
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        app.cliente = app.clientes[indexPath.row]
        let formularioViewController = FormularioViewController()
        app.window?.rootViewController = formularioViewController
        app.window?.makeKeyAndVisible()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clientesTableView.delegate = self
        clientesTableView.dataSource = self
        clientesTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        // Do any additional setup after loading the view.
    }
    
    
}
