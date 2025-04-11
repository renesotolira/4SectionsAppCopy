//
//  NoticiaFeedViewModel.swift
//  TabsApp
//
//  Created by rene on 16/01/25.
//

import Foundation

struct NoticiaFeedViewModel{
    
    func getData() -> [ NoticiaModel ] {
        //imaginamos conectamos con la APi
        let noticiasFeed: [ NoticiaModel ] =
        [
            NoticiaModel(id: 1, image: "camera", title: "primer noticia", description: "Primera descripcion"),
            
            NoticiaModel(id: 2, image: "car", title: "segunda noticia", description: "segunda descripcion"),
            
            NoticiaModel(id: 3, image: "car", title: "tercera noticia", description: "tercera descripcion"),
            
            NoticiaModel(id: 4, image: "phone", title: "cuarta noticia", description: "cuarta descripcion"),
            
            NoticiaModel(id: 5, image: "camera", title: "quinta noticia", description: "quinta descripcion"),
            
            NoticiaModel(id: 3, image: "camera", title: "sexta noticia", description: "sexta descripcion"),
           
        ]
        
        return noticiasFeed
    }
    
}
