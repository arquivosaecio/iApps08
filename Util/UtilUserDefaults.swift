//
//  UtilUserDefaults.swift
//  Projeto 11 - UserDefaults
//
//  Created by iApps on 30/11/19.
//  Copyright © 2019 iApps. All rights reserved.
//

import UIKit

class UtilUserDefaults: NSObject {
    
    let prefs = UserDefaults.standard
    
    func saveOrUpdate(key : String , value : AnyObject) -> Bool {
        prefs.set(value, forKey: key)
        return prefs.synchronize()
    }
    
    func exists(key : String) -> Bool {
        return prefs.object(forKey: key) != nil ? true : false
    }
    
    func load(key : String) -> AnyObject {
        return prefs.object(forKey: key) as AnyObject
    }
    
    func load(key : String , defaultValue : Int) -> Int {
        if(exists(key: key)){
            return load(key: key) as! Int
        }else{
              return defaultValue
        }
    }
    
    func load(key : String , defaultValue : Double) -> Double {
        if(exists(key: key)){
            return load(key: key) as! Double
        }else{
              return defaultValue
        }
    }
    
    func load(key : String , defaultValue : String) -> String {
        if(exists(key: key)){
            return load(key: key) as! String
        }else{
              return defaultValue
        }
    }
    
    func removeAllKeys(){
        
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        
        dictionary.keys.forEach {
            key in defaults.removeObject(forKey: key)
        }
        
    }

}
