//
//  NoticiaFeedView.swift
//  TabsApp
//
//  Created by rene on 16/01/25.
//

import SwiftUI

struct NoticiaFeedView: View {
    var noticia: NoticiaModel
    
    var body: some View {
        VStack(spacing: 16){
            Image(systemName: noticia.image)
                .font(.largeTitle)
            
            Text(noticia.title)
            Text(noticia.description)
            
            Button(action:{
                
            }){
                Text("Ver más")
            }
        }
        .frame(width: .infinity)
        .padding(.horizontal, 16)
    }
}

struct NoticiaFeedView_Previews: PreviewProvider {
    
    static var previews: some View {
        NoticiaFeedView(noticia: NoticiaModel(image: "camera", title: "titulo" , description: "adios"))
    }
}
