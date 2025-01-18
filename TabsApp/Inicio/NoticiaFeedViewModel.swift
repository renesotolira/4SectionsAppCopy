//
//  NoticiaFeedViewModel.swift
//  TabsApp
//
//  Created by rene on 16/01/25.
//

import Foundation

struct NoticiaFeedViewModel{
    
    func getData(){
        //imaginamos conectamos con la APi
        let noticiasFeed: [ NoticiaModel ] =
        [
            NoticiaModel(image: "camera", title: "primer noticia", description: "Primera descripcion"),
            
            NoticiaModel(image: "airplain", title: "segunda noticia", description: "segunda descripcion"),
            
            NoticiaModel(image: "car", title: "tercera noticia", description: "tercera descripcion"),
        ]
        
    }
    
}
