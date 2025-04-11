//
//  ListadoView.swift
//  TabsApp
//
//  Created by rene on 18/02/25.
//

import SwiftUI

struct ListadoView: View {
    @Environment(\.presentationMode) var presentationMode
    var convenio : ConveniosApiModel
    @StateObject var conveniosApi = ConveniosViewModel()
    
    let columns = [
        GridItem(.flexible() ),
        GridItem(.flexible() ),
    ]
    
    var body: some View {
        VStack{
            ScrollView(){
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(conveniosApi.listado, id: \.self.id){ listado in
                        //interfaz a repetir se recomeindo LazyVStack y dentro la imagen,texto,etc
                        LazyVStack{
                            
                            NavigationLink(destination: NegocioView(id: listado.id)){
                                ///----------------------
                                VStack{
                                    ImagesVisualizer(
                                        url: listado.imagen_predeterminada,
                                        width: 150,
                                        height: 160,
                                        contentScale: .fit)
                                        .cornerRadius(10.0)
                                    Text(listado.titulo)
                                        .font(.custom("Montserrat-Bold", size: 18))
                                    //.foregroundColor(.red)
                                    
                                    Divider()
                                }
                                ///----------------------
                            }
                            
                            
                        }
                    }
               }
            }
        }.onAppear(){
            conveniosApi.getListadoById(id: convenio.id)
        }
       
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackNavBar( title: "Directorio"))
        .navigationTitle(convenio.nombre)
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct ListadoView_Previews: PreviewProvider {
    static var previews: some View {
        ListadoView(convenio:
                        ConveniosApiModel(
                            id: 1,
                            nombre: "prueba",
                            imagen_categoria_negocios: ""
                        )
        )
    }
}
