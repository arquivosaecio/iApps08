//
//  UtilAparelho.swift
//  Projeto 09 - App Universal
//
//  Created by iApps on 23/11/19.
//  Copyright © 2019 iApps. All rights reserved.
//

import UIKit

class UtilAparelho: NSObject {
    
    var deviceCode = 0
    
    override init() {
        super.init()
        
        deviceCode = UIDevice.current.model == "iPhone" ? 0 : 1
        
    }

}
