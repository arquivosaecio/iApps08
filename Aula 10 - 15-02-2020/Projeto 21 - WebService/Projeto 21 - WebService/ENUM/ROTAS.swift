//
//  ROTAS.swift
//  Projeto 21 - WebService
//
//  Created by Master Mac on 02/08/19.
//  Copyright © 2019 Aecio. All rights reserved.
//

import Foundation

enum CONEXAO : String {
    
    case PROTOCOLO = "http://"
    case IP = "localhost:"
    case PORTA = "8888/"
    
}

enum ROTA : String {
    
    case CONTATO_INSERIR = "AgendaWebContatoInserir.php"
    case CONTATO_ATUALIZAR = "AgendaWebContatoAtualizar.php"
    case CONTATO_EXCLUIR = "AgendaWebContatoExcluir.php"
    case CONTATO_BUSCAR = "AgendaWebContatoBuscar.php"
    case CONTATO_TODOS = "AgendaWebContatoTodos.php"
    
}
