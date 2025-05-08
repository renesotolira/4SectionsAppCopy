//
//  InicioView.swift
//  TabsApp
//
//  Created by rene on 16/01/25.
//

import SwiftUI

struct InicioView: View {

    //contenido del servidor
   @StateObject var noticiasApi = NoticiasViewModel()
    //ObservedObject  ambos pueden ver los cambios de las variables @Published
    

    var body: some View {
            ScrollView {
                
                ForEach(noticiasApi.noticias.indices, id: \.self) { noticiaIndex in
                    
                    LazyVStack {
                        NoticiaFeedView(noticia: noticiasApi.noticias[noticiaIndex])
                            .onAppear(){
                                //aqui
                               noticiasApi.nextData(noticiaIndex)
                            }
                    }
                }
                
                /*
                 ForEach(directoryViewModel.directories.indices,id:\.self) { index in
                 */
                
                ///
                Button(action:{
                   // noticiasApi.getNoticiasFromApi()
                }){
                    Text("Recargar pagina")
                }
                
            }
            .onAppear(){
              noticiasApi.getNoticiasFromApi()
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("")
            .navigationBarItems(leading:
               LogoHeaderView()
            )
    }
}


struct InicioView_Previews: PreviewProvider {
    static var previews: some View {
        InicioView()
    }
}
