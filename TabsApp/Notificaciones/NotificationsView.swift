//
//  NotificationsView.swift
//  TabsApp
//
//  Created by rene senoquia on 01/05/25.
//

import SwiftUI
import CoreData

struct NotificationsView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: Notification.entity(), sortDescriptors: [NSSortDescriptor(key:"date", ascending: false)])
    
  //  select * from Notification order by date DESC; <--->
    
    private var myNotifications: FetchedResults<Notification>
    
    var body: some View {
        VStack{
            ScrollView(){
                ForEach(myNotifications){ notification in
                    LazyVStack(alignment: .leading){
                        Text(notification.title ?? "").multilineTextAlignment(.leading)
                        Text(notification.body ?? "").multilineTextAlignment(.leading)
                        Text(String(notification.kind) ?? "NO TIENE").multilineTextAlignment(.leading)
                        
                        if(notification.kind == 1){
                            NavigationLink(destination: NegocioView(id: Int(notification.id_objeto)))
                            {
                                Text("Ver Negocio")
                            }
                        }else if(notification.kind == 0){
                            NavigationLink(destination: NoticiaIndividualView(noticia: Int(notification.id_objeto))
                            ){
                                Text("Ver Noticia")
                            }
                        }
                        
                    }
                    Divider()
                }
            }
        }
            
    }
}

#Preview {
    
    ScrollView(){
        VStack(alignment: .leading){
            Text("Titulo").multilineTextAlignment(.leading)
            Text("mensaje").multilineTextAlignment(.leading)
        }
        Divider()
        
        VStack(alignment: .leading){
            Text("Titulo 2").multilineTextAlignment(.leading)
            Text("mensaje 2").multilineTextAlignment(.leading)
        }
    }
    
    // NotificationsView()
}
