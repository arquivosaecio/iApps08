//
//  ClienteStored+CoreDataProperties.swift
//  
//
//  Created by Master Mac on 15/02/20.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension ClienteStored {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ClienteStored> {
        return NSFetchRequest<ClienteStored>(entityName: "ClienteStored")
    }

    @NSManaged public var email: String?
    @NSManaged public var fone: String?
    @NSManaged public var idTimeStamp: String?
    @NSManaged public var nome: String?

}
