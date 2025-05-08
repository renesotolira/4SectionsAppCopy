//
//  PersistenceController.swift
//  TabsApp
//
//  Created by rene on 16/04/25.
//

import Foundation
import CoreData

struct PersistenceController{
    
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    init(){
        container = NSPersistentContainer(name: "DataBase")
        
        container.loadPersistentStores{
            (storeDescription, error) in
            
            if let error = error as NSError? {
                fatalError("No se pudo conectar a la db: \(error)")
            }
        }
    }
    
}
