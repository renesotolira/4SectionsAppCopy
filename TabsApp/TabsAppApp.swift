//
//  TabsAppApp.swift
//  TabsApp
//
//  Created by rene on 10/01/25.
//

import SwiftUI
import OneSignal
//import OneSignalFramework

@main
struct TabsAppApp: App {
    
 
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    let persistenceController = PersistenceController.shared
   
   
    
    var body: some Scene {
        WindowGroup {
            //SignUpView()
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification)
                ){ _ in
                    print("holi")
                    let notification = NotificationModel(context: persistenceController.container.viewContext)
                    print("son un total de ")
                    print(notification.countNotif())
                }
        }
    }
}



class AppDelegate: NSObject, UIApplicationDelegate, OSPermissionObserver {
    
    func onOSPermissionChanged(_ stateChanges: OSPermissionStateChanges){
        /*Se ejecuta cuando el usuario decide cambiar el permiso de notificaiocnes
         Es decir si lo tenia habilitado pero ahora no entrará aquí
         o vicversa al principio estaba rechazado pero ahora lo acepta
         
         */
    }
    
    
    //inicia application
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        
       // OneSignal.setLogLevel(.LL_VERBOSE, visualLevel: .LL_NONE)
        // 🔧 Inicializa OneSignal
        DispatchQueue.main.async {
            OneSignal.initWithLaunchOptions(launchOptions)
            OneSignal.setAppId("8f220ef1-ff15-42de-994a-e6c3d822b0ea")
            OneSignal.add(self as OSPermissionObserver)
            // Pide permiso de notificaciones (esto también lo puedes hacer más tarde)
            OneSignal.promptForPushNotifications(userResponse: { accepted in
                print("Permiso notificaciones: \(accepted)")
            })
        }
        
        return true
    }
    //finalizar application
    

    
    func application(_ application: UIApplication,
                     didReceiveRemoteNotification userInfo: [AnyHashable: Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void
    ){
        var title: String = ""
        var body: String = ""
        var flag: Bool = false
        var kind: Int = -1
        var id_objeto: Int = 0
        /*
         -1 no existe
         0 es noticia
         1 es convenio
         */
        
        /*APS -
         Apple Push Service...
         */
        print("notif recibida")
        if let aps = userInfo[AnyHashable("aps")] as? NSDictionary{
            if let alert = aps["alert"] as? NSDictionary{
                title = alert["title"] as? String ?? "-Sin titulo-"
                body = alert["body"] as? String ?? "--No hay mensaje--"
                flag = true
                print("----aps----")
                print(aps)
                print("--------")
               
                //intentar obtener si existe datos adicionales de la notif
                if let custom = userInfo["custom"] as? NSDictionary{
                    print("----custom----")
                    print(custom)
                    print("--------")
                   
                    if let moreData = custom["a"] as? NSDictionary{
                        print("----more----")
                        print(moreData)
                        print("--------")
                        
                        //aqui obtener id_objeto y kind
                        if let extraField = (moreData["kind"] as? NSString)?.integerValue{
                                kind = extraField
                            print("----kind----")
                            print("\(extraField)")
                            print("--------")
                        }else{
                           // kind = moreData["kind"] as! Int
                            print("no pudo convertir a entero kind")
                        }
                        
                        if let extraFieldo = (moreData["id_objeto"] as? NSString)?.integerValue{
                            id_objeto = extraFieldo
                            
                            print("----id_objeto----")
                            print("\(extraFieldo)")
                            print("--------")
                        }else{
                            //id_objeto = moreData["id_objeto"] as! Int
                            print("no pudo convertir a entero id ")
                        }

                        
                       
                    }
                }
            }
        }
        
        //custom -> a -> 1,2,3,4
    
        
        if(flag){
            //nuestra logica para guardarlo en la app
            let persistenceController = PersistenceController.shared
            let notification = NotificationModel(context: persistenceController.container.viewContext)
            //hacemos insert en la db
            let success = notification.add(message: body, title: title, id: id_objeto, kind: kind )
            if(success){
                print("notif guardada")
            }else{
                print("notif no guardada")
            }
        }
        
        completionHandler(UIBackgroundFetchResult.newData)
    }
    
}

