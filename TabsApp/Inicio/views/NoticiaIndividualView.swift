//
//  HomeView.swift
//  TabsApp
//
//  Created by rene on 10/01/25.
//

import SwiftUI

struct NoticiaIndividualView: View {
    let screenHeight = UIScreen.main.bounds.height
    let screenAncho = UIScreen.main.bounds.width
    @Environment(\.presentationMode) var presentationMode
    var noticia: Int//NoticiaApiModel
    @StateObject var noticiasApi = NoticiasViewModel()
    
    var body: some View {
        
        ScrollView(){
            VStack(alignment: .leading, spacing: 16){
                
                HStack(spacing: 16){
                    
                    ImagesVisualizer(
                        url: noticiasApi.noticia.imagen_negocio,
                        width: 35 ,
                        height: 35
                    )
                    
                    VStack{
                        Text(noticiasApi.noticia.nombre_negocio)
                            .fontWeight(.bold)
                    }
                    Spacer()
                }.padding(6)
                
                ImagesVisualizer(
                    url: noticiasApi.noticia.imagen_predeterminada,
                    width: screenAncho*0.90 ,
                    height: screenHeight*0.60,
                    contentScale: .fit
                )
                
                
                
                HStack{
                    Text(noticiasApi.noticia.titulo)
                        .font(.custom("Montserrat-ExtraBold", size: 20))
                    // .font(.title3)
                    Spacer()
                }
                
                
                Text(noticiasApi.plainText)
                    .font(.custom("Montserrat-Regular", size: 20))
            }.padding(4)
        }
        .onAppear(){
            noticiasApi.getNoticiaById(id: noticia)
        }
        .navigationTitle(noticiasApi.noticia.titulo)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackNavBar() )
        /*, trailing: Text("hol").foregroundColor(.red)
        */
        
        
        
        
    }
}

struct NoticiaIndividualView_Previews: PreviewProvider {
    static var previews: some View {
        Text("ya dejame en paz")
        /*NoticiaIndividualView(noticia: NoticiaApiModel(id: 1, title: "titulo" , content: "adios", featured_image: FeaturedImage(thumbnail: "", medium: "", large: "")    , business_logo: "" , business_name: "")
         )*/
    }
}
