//
//  UtilAcelerometro.swift
//  Projeto 24 - Acelerometro
//
//  Created by Master Mac on 09/08/19.
//  Copyright © 2019 Aecio. All rights reserved.
//

import UIKit

class UtilAcelerometro: NSObject {
    
    class func converterP2A(polar : Double) -> Double{
        var moduloX = polar * -1
        moduloX = moduloX + 1
        let anguloAlfa = moduloX * 90
        return anguloAlfa
    }

}
