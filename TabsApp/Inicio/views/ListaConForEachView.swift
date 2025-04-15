//
//  ListaConForEachView.swift
//  TabsApp
//
//  Created by rene on 21/01/25.
//

import SwiftUI

struct ListaConForEachView: View {
    @State var noticiasList : [NoticiaModel] = NoticiaFeedViewModel().getData()
    
    var body: some View {
        
        /*
         ForEach -> para diseño personalizado o vistas complejas
         List -> diseño simple
         List + ForEach -> diseño medio-simple + funciones propios del sistema
         */
        
        NavigationView{
           
            /*NavigationLink(destination: NoticiaIndividualView()){
                Text(  "Lista de noticias" )
            }*/
           List( ){
                ForEach(noticiasList, id: \.self.uuid ){ noticiaIndex in
                    //vista a repetir
                    VStack{
                      // NoticiaFeedView(noticia: noticiaIndex)
                        Text("\(noticiaIndex.uuid)")
                    }
                }.onDelete { indexSet in
                    self.noticiasList.remove(atOffsets: indexSet )
                }
            
           }.listStyle(PlainListStyle())
            
            
        }
    }
}

struct ListaConForEachView_Previews: PreviewProvider {
    static var previews: some View {
        ListaConForEachView()
    }
}
