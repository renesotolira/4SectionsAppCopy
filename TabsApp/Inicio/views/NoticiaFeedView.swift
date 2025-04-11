//
//  NoticiaFeedView.swift
//  TabsApp
//
//  Created by rene on 16/01/25.
//

import SwiftUI

struct NoticiaFeedView: View {
    let screenHeight = UIScreen.main.bounds.height
    let screenAncho = UIScreen.main.bounds.width
    var noticia: NoticiaApiModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16){
    
            BusinessRow(id: noticia.id_negocio, url: noticia.business_logo, name: noticia.business_name)
            
            
            ImagesVisualizer(
                url: noticia.featured_image.large,
                width: screenAncho * 0.90 ,
                height: screenHeight * 0.60,
                contentScale: .fit
            )
            
            HStack{
                Text(noticia.title)
                    .font(.custom("Montserrat-ExtraBold", size: 20))
                Spacer()
            }
            
            Text(noticia.content ?? "-- sin descripción --")
                .font(.custom("Montserrat-Regular", size: 16))
                
            NavigationLink(destination: NoticiaIndividualView(noticia: noticia)
            ){
                Text("Ver más")
            }
            
            Divider()
        }
        .navigationBarTitleDisplayMode(.inline)
        .padding(.horizontal, 16)
    }
}


struct NoticiaFeedView_Previews: PreviewProvider {
    
    static var previews: some View {
        NoticiaFeedView(noticia: NoticiaApiModel(id: 1, id_negocio: 1, title: "titulo" , content: "adios", featured_image: FeaturedImage(thumbnail: "", medium: "", large: "")    , business_logo: "" , business_name: ""))
    }
}
