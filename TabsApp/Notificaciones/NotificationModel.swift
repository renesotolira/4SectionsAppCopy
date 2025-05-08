//
//  NotificationModel.swift
//  TabsApp
//
//  Created by rene on 17/04/25.
//

import Foundation
import CoreData

class NotificationModel{
    
    var viewContext: NSManagedObjectContext
   
    init(context: NSManagedObjectContext){
        self.viewContext = context
    }
    
    /* TRUCAZO cuando cambio la db
     A veces Xcode no genera bien las clases automáticamente. Haz esto:

     Shift + Cmd + K → Limpiar proyecto

     Luego Cmd + B → Compilar de nuevo
     */
    
    /*
     ionic <--> js ios, android
     Xamarin <--> XML , C#
     Vuejs for mobile
     Flutter <--> Dart Android developer
     
     JetBrains
     
     Kotlin Multiplatform <--->
        web frontend, backend, desktop
     
     Androi Studio
        
     
     */
    func countNotif() -> Int {
        let fetchRequest = NSFetchRequest<Notification>(entityName: "Notification")
        let countOfItems = try! self.viewContext.count(for: fetchRequest)
        print(countOfItems)
        return countOfItems
    }
    
    func add(message: String, title: String, id: Int, kind: Int) -> Bool{
        //add - INSERT INTO notifications SET VALUE ( title = title ,.. )
        let currentDate = Date() // 2024-04-16
        let myNotif = Notification(context: viewContext)
        myNotif.body = message
        myNotif.date = currentDate
        myNotif.id_objeto = Int32(id)
        myNotif.kind = Int16(kind)  /*kind define si es notifica, convenio o no tiene*/
        myNotif.title = title
        myNotif.readit = false
        return saveChanges()
    }
    
    func saveChanges() -> Bool{
        do{
            try self.viewContext.save()
            return true
        }catch{
            let error = error as NSError
            print("Error al guardar notificacion", error.localizedDescription)
            return false
        }
    }
    
}
