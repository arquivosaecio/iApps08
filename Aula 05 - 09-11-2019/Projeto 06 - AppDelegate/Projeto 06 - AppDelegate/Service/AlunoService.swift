//
//  AlunoService.swift
//  Projeto 06 - AppDelegate
//
//  Created by iApps on 09/11/19.
//  Copyright © 2019 iApps. All rights reserved.
//

import UIKit

class AlunoService: NSObject {
    
    func getMedia(aluno : Aluno) -> Aluno {
        
        aluno.media = (aluno.p1 + aluno.p2) / 2
        return aluno
        
    }
    

}
