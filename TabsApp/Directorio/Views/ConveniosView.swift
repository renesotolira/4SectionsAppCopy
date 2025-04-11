//
//  ConveniosView.swift
//  TabsApp
//
//  Created by rene on 11/02/25.
//

import SwiftUI
import SwiftUI

struct ConveniosView: View {
    @State var search: String = ""
    @StateObject var conveniosApi = ConveniosViewModel()
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "magnifyingglass")
                TextField("Buscar ...", text: $search)
                    .disableAutocorrection(true)
                    .font(.title)
            }
            .cornerRadius(3.0)
            .background(Color("backgroundSearchBar"))
            .padding(.horizontal, 15)
            
            
            ScrollView(){
                
                if(search.isEmpty || search.count < 3){
                /*pantalla de convenios*/
                ForEach(conveniosApi.convenios, id: \.self.id){ convenio in
                    
                    NavigationLink(destination: ListadoView(convenio: convenio)
                    ){
                        LazyVStack{
                        ImagesVisualizer(
                            url: convenio.imagen_categoria_negocios,
                            width: 300,
                            height: 160,
                            contentScale: .fit)
                            .cornerRadius(10.0)
                        Text(convenio.nombre)
                            .font(.custom("Montserrat-Bold", size: 18))
                        
                        Divider()
                       
                    }
                    }
                    
                    .padding(5)
                }
                }else{
                    ForEach(conveniosApi.searchBusiness(search) , id: \.self.id ){
                        negocio in
                        LazyVStack{
                            BusinessRow(id: negocio.id, url: negocio.imagen_predeterminada.large, name: negocio.titulo)
                        }
                    }
                }
               
                
            }
        }
        .onAppear(){
            conveniosApi.getCategorias()
        }
        
        .navigationBarHidden(true)
        /*.navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Convenios")
        .navigationBarItems(leading:
                                LogoHeaderView()
        )*/
    }
}

struct Convenios_Previews: PreviewProvider {
    static var previews: some View {
        ConveniosView()
    }
}
